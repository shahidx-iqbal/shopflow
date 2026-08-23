import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/receipt/receipt_actions.dart';
import '../../../../core/receipt/receipt_preview_sheet.dart';
import '../../../../core/receipt/receipt_text_builder.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_enums.dart';

/// Receipt view + WhatsApp share helpers for post-checkout success flow.
class PosReceiptActions {
  PosReceiptActions._();

  static Future<void> viewReceipt(BuildContext context, SaleEntity sale) {
    return ReceiptPreviewSheet.show(context, sale: sale);
  }

  static Future<void> shareOnWhatsApp(
    BuildContext context,
    SaleEntity sale,
  ) async {
    final phone = await _resolveSharePhone(context, sale);
    if (phone == null || !context.mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final data = await ReceiptActions.buildReceiptData(sale, l10n);
    final receiptText = ReceiptTextBuilder.build(data);

    final uri = Uri.parse(
      'https://wa.me/${_normalizePhone(phone)}?text=${Uri.encodeComponent(receiptText)}',
    );

    try {
      await Share.shareUri(uri);
    } catch (_) {
      await Share.share(receiptText);
    }
  }

  static Future<String?> _resolveSharePhone(
    BuildContext context,
    SaleEntity sale,
  ) async {
    final customerPhone = sale.customer?.phone.trim();
    if (sale.saleType == SaleType.ledger &&
        customerPhone != null &&
        customerPhone.isNotEmpty) {
      return customerPhone;
    }

    if (customerPhone != null && customerPhone.isNotEmpty) {
      return customerPhone;
    }

    return _promptForPhone(context);
  }

  static Future<String?> _promptForPhone(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    final phone = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.posSharePhoneTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.posSharePhoneMessage),
            const SizedBox(height: 16),
            AppTextField(
              label: l10n.customerPhoneLabel,
              controller: controller,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.btnCancel),
          ),
          TextButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isEmpty) return;
              Navigator.pop(ctx, value);
            },
            child: Text(l10n.posShareWhatsApp),
          ),
        ],
      ),
    );

    controller.dispose();
    return phone;
  }

  static String _normalizePhone(String raw) {
    var digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('0')) {
      digits = '92${digits.substring(1)}';
    } else if (!digits.startsWith('92')) {
      digits = '92$digits';
    }
    return digits;
  }
}
