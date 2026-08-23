import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../utils/formatters.dart';
import '../../features/pos/domain/entities/sale_entity.dart';
import '../../features/pos/domain/entities/sale_enums.dart';
import '../../features/pos/domain/services/pos_cart_calculator.dart';
import '../../features/settings/domain/entities/receipt_settings_entity.dart';
import '../../features/shop/domain/entities/shop_profile_entity.dart';
import '../../l10n/app_localizations.dart';
import 'receipt_data.dart';

/// Pure Dart builder — turns sale + settings into structured [ReceiptData].
class ReceiptTemplateBuilder {
  ReceiptTemplateBuilder._();

  static ReceiptData build({
    required SaleEntity sale,
    required ReceiptSettingsEntity settings,
    required ShopProfileEntity shop,
    required AppLocalizations l10n,
  }) {
    final lines = sale.items.map((item) {
      final qtyLabel =
          '${Formatters.quantity(item.quantity)} ${item.unit} × ${Formatters.currency(item.unitPrice)}';
      String? discountLine;
      if (settings.showItemDiscount && item.discount > 0) {
        discountLine =
            '${l10n.posItemDiscount}: -${Formatters.currency(item.discount)}';
      }
      return ReceiptLineItem(
        name: item.productName,
        qtyLabel: qtyLabel,
        amount: Formatters.currency(item.lineTotal),
        discountLine: discountLine,
      );
    }).toList();

    final subtotal = sale.subtotal > 0
        ? sale.subtotal
        : PosCartCalculator.itemsSubtotal(sale.items);
    final summaryRows = <ReceiptSummaryRow>[];

    if (settings.showTaxBreakdown) {
      summaryRows.add(
        ReceiptSummaryRow(
          label: l10n.posSubtotal,
          amount: Formatters.currency(subtotal),
        ),
      );
      if (sale.discount > 0) {
        summaryRows.add(
          ReceiptSummaryRow(
            label: l10n.posCartDiscount,
            amount: '-${Formatters.currency(sale.discount)}',
          ),
        );
      }
      if (sale.tax > 0) {
        summaryRows.add(
          ReceiptSummaryRow(
            label: l10n.posTax,
            amount: Formatters.currency(sale.tax),
          ),
        );
      }
    }

    final paymentRows = <ReceiptSummaryRow>[];
    if (sale.saleType == SaleType.cash) {
      final cash = sale.cashReceived ?? sale.total;
      if (cash > 0) {
        paymentRows.add(
          ReceiptSummaryRow(
            label: l10n.posCashReceived,
            amount: Formatters.currency(cash),
          ),
        );
      }
      final change = Formatters.roundCurrency(
        (cash - sale.total).clamp(0, double.infinity),
      );
      if (change > 0) {
        paymentRows.add(
          ReceiptSummaryRow(
            label: l10n.posChangeDue,
            amount: Formatters.currency(change),
          ),
        );
      }
    } else {
      final paidNow = sale.amountPaidNow ?? 0;
      if (paidNow > 0) {
        paymentRows.add(
          ReceiptSummaryRow(
            label: l10n.ledgerAmountReceived,
            amount: Formatters.currency(paidNow),
          ),
        );
      }
      final ledgerRemainder = sale.addedToLedger ?? 0;
      if (ledgerRemainder > 0) {
        paymentRows.add(
          ReceiptSummaryRow(
            label: l10n.posLedgerRemainder,
            amount: Formatters.currency(ledgerRemainder),
          ),
        );
      }
    }

    final invoice = sale.invoiceNumber?.trim();
    return ReceiptData(
      shopName: shop.shopName,
      logoPath: settings.showLogo ? shop.logoPath : null,
      address: settings.showAddress ? shop.address : null,
      phone: settings.showPhone ? shop.phone : null,
      taxNumberLine: settings.showTaxNumber && shop.taxNumber != null
          ? '${l10n.shopProfileTaxNumberLabel}: ${shop.taxNumber}'
          : null,
      headerNote: settings.headerNote.isEmpty ? null : settings.headerNote,
      footerNote: settings.footerNote.isEmpty ? null : settings.footerNote,
      receiptNumber: (invoice != null && invoice.isNotEmpty)
          ? invoice
          : '${settings.receiptNumberPrefix}${sale.id}',
      dateLabel: Formatters.dateTime(sale.createdAt),
      lines: lines,
      totalLabel: l10n.posTotal,
      totalAmount: Formatters.currency(sale.total),
      customerLine: settings.showCustomerName && sale.customer != null
          ? '${l10n.customerNameLabel}: ${sale.customer!.name}'
          : null,
      cashierLine: settings.showCashierName
          ? 'Cashier: ${shop.ownerName}'
          : null,
      paymentMethodLine: settings.showPaymentMethod
          ? '${l10n.invoicePaymentStatus}: ${_paymentLabel(l10n, sale)}'
          : null,
      ledgerBalanceLine: settings.showLedgerBalance &&
              sale.saleType == SaleType.ledger &&
              sale.customer != null
          ? '${l10n.ledgerBalance}: ${Formatters.currency(sale.customer!.balance)}'
          : null,
      summaryRows: summaryRows,
      paymentRows: paymentRows,
    );
  }

  static String _paymentLabel(AppLocalizations l10n, SaleEntity sale) {
    if (sale.saleType == SaleType.cash) return l10n.posSaleTypeCash;
    return switch (sale.paymentStatus) {
      PaymentStatus.paid => l10n.paymentStatusPaid,
      PaymentStatus.partiallyPaid => l10n.paymentStatusPartiallyPaid,
      PaymentStatus.unpaid => l10n.paymentStatusUnpaid,
    };
  }
}

/// Swappable receipt output — PNG widget, PDF, or printer driver.
abstract class ReceiptRenderer {
  Widget buildWidget(ReceiptData data);
}

/// Renders [ReceiptData] as a Flutter widget (PNG via RepaintBoundary at share time).
class ImageReceiptRenderer implements ReceiptRenderer {
  @override
  Widget buildWidget(ReceiptData data) => ReceiptPreviewWidget(data: data);
}

/// PDF output — same [ReceiptData] input; implement when needed.
class PdfReceiptRenderer implements ReceiptRenderer {
  @override
  Widget buildWidget(ReceiptData data) {
    throw UnimplementedError('PdfReceiptRenderer is not implemented yet');
  }
}

/// Thermal printer output — implement when hardware integration is added.
class PrintReceiptRenderer implements ReceiptRenderer {
  @override
  Widget buildWidget(ReceiptData data) {
    throw UnimplementedError('PrintReceiptRenderer is not implemented yet');
  }
}

/// Visual receipt preview widget shared by settings preview and post-sale view.
class ReceiptPreviewWidget extends StatelessWidget {
  const ReceiptPreviewWidget({required this.data, super.key});

  final ReceiptData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(AppDimensions.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (data.logoPath != null) ...[
            _LogoAvatar(path: data.logoPath!),
            const SizedBox(height: AppDimensions.space12),
          ],
          Text(
            data.shopName,
            style: AppTextStyles.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (data.address != null) ...[
            const SizedBox(height: AppDimensions.space4),
            Text(
              data.address!,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
              textAlign: TextAlign.center,
            ),
          ],
          if (data.phone != null)
            Text(
              data.phone!,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
              textAlign: TextAlign.center,
            ),
          if (data.taxNumberLine != null)
            Text(
              data.taxNumberLine!,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
              textAlign: TextAlign.center,
            ),
          if (data.headerNote != null) ...[
            const SizedBox(height: AppDimensions.space8),
            Text(
              data.headerNote!,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.space16),
            child: Divider(height: 1, color: AppColors.border),
          ),
          Text(
            data.receiptNumber,
            style: AppTextStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.space4),
          Text(
            data.dateLabel,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
          ),
          if (data.customerLine != null) ...[
            const SizedBox(height: AppDimensions.space8),
            _metaLine(data.customerLine!),
          ],
          if (data.cashierLine != null) _metaLine(data.cashierLine!),
          const SizedBox(height: AppDimensions.space16),
          ...data.lines.map(_lineItem),
          if (data.summaryRows.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.space12),
              child: Divider(height: 1, color: AppColors.border),
            ),
            ...data.summaryRows.map(_summaryRow),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.space12),
            child: Divider(height: 1, color: AppColors.border),
          ),
          _summaryRow(
            ReceiptSummaryRow(
              label: data.totalLabel,
              amount: data.totalAmount,
              emphasized: true,
            ),
          ),
          if (data.paymentMethodLine != null) ...[
            const SizedBox(height: AppDimensions.space8),
            _metaLine(data.paymentMethodLine!),
          ],
          ...data.paymentRows.map(_summaryRow),
          if (data.ledgerBalanceLine != null) ...[
            const SizedBox(height: AppDimensions.space4),
            _metaLine(
              data.ledgerBalanceLine!,
              emphasized: true,
            ),
          ],
          if (data.footerNote != null) ...[
            const SizedBox(height: AppDimensions.space16),
            Text(
              data.footerNote!,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _metaLine(String text, {bool emphasized = false}) {
    return Text(
      text,
      style: (emphasized ? AppTextStyles.labelLarge : AppTextStyles.bodySmall)
          .copyWith(
        color: emphasized ? AppColors.textPrimary : AppColors.neutral,
        fontWeight: emphasized ? FontWeight.w600 : FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _lineItem(ReceiptLineItem line) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(line.name, style: AppTextStyles.bodyMedium),
                Text(
                  line.qtyLabel,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
                if (line.discountLine != null)
                  Text(
                    line.discountLine!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.tertiary,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            line.amount,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(ReceiptSummaryRow row) {
    final style = row.emphasized
        ? AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.bold)
        : AppTextStyles.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(row.label, style: style),
          Text(row.amount, style: style),
        ],
      ),
    );
  }
}

class _LogoAvatar extends StatelessWidget {
  const _LogoAvatar({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    ImageProvider? image;
    if (path.startsWith('http')) {
      image = NetworkImage(path);
    } else if (path.startsWith('/')) {
      image = FileImage(File(path));
    }

    return CircleAvatar(
      radius: 28,
      backgroundColor: AppColors.secondaryLight,
      backgroundImage: image,
      child: image == null
          ? Icon(
              Icons.storefront_outlined,
              color: AppColors.secondary.withValues(alpha: 0.8),
            )
          : null,
    );
  }
}
