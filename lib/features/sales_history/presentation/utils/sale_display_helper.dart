import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';

/// Localized labels and colors for sales history UI.
class SaleDisplayHelper {
  SaleDisplayHelper._();

  static Color accentColor(SaleEntity sale) =>
      sale.saleType == SaleType.cash ? AppColors.primary : AppColors.tertiary;

  static Color accentLightColor(SaleEntity sale) =>
      sale.saleType == SaleType.cash
          ? AppColors.primaryLight
          : AppColors.tertiaryLight;

  static String title(AppLocalizations l10n, SaleEntity sale) {
    if (sale.saleType == SaleType.cash) return l10n.posSaleTypeCash;
    return sale.customer?.name ?? l10n.posSaleTypeLedger;
  }

  static String statusLabel(AppLocalizations l10n, SaleEntity sale) {
    if (sale.saleType == SaleType.cash) return l10n.salesFilterCash;
    return switch (sale.paymentStatus) {
      PaymentStatus.paid => l10n.paymentStatusPaid,
      PaymentStatus.partiallyPaid => l10n.paymentStatusPartiallyPaid,
      PaymentStatus.unpaid => l10n.paymentStatusUnpaid,
    };
  }

  static Color statusColor(SaleEntity sale) {
    if (sale.saleType == SaleType.cash) return AppColors.primary;
    return switch (sale.paymentStatus) {
      PaymentStatus.paid => AppColors.primary,
      PaymentStatus.partiallyPaid => AppColors.tertiary,
      PaymentStatus.unpaid => AppColors.danger,
    };
  }

  static Color statusBackgroundColor(SaleEntity sale) {
    if (sale.saleType == SaleType.cash) return AppColors.primaryLight;
    return switch (sale.paymentStatus) {
      PaymentStatus.paid => AppColors.primaryLight,
      PaymentStatus.partiallyPaid => AppColors.tertiaryLight,
      PaymentStatus.unpaid => AppColors.dangerLight,
    };
  }

  static int itemCount(SaleEntity sale) =>
      sale.items.fold<double>(0, (sum, item) => sum + item.quantity).round();
}
