import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../../features/pos/domain/entities/sale_entity.dart';
import '../../features/settings/domain/entities/receipt_settings_entity.dart';
import '../../l10n/app_localizations.dart';
import 'receipt_actions.dart';
import 'receipt_template_builder.dart';

/// Shows the formatted receipt preview used in Receipt Settings and after POS checkout.
class ReceiptPreviewSheet {
  ReceiptPreviewSheet._();

  static Future<void> show(
    BuildContext context, {
    required SaleEntity sale,
    String? title,
    ReceiptSettingsEntity? settingsOverride,
  }) async {
    final l10n = AppLocalizations.of(context)!;

    final data = await ReceiptActions.buildReceiptData(
      sale,
      l10n,
      settingsOverride: settingsOverride,
    );

    if (!context.mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          children: [
            Text(
              title ?? l10n.receiptPreviewTitle,
              style: AppTextStyles.headlineSmall,
            ),
            const SizedBox(height: AppDimensions.space16),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              clipBehavior: Clip.antiAlias,
              child: ImageReceiptRenderer().buildWidget(data),
            ),
            const SizedBox(height: AppDimensions.space24),
          ],
        ),
      ),
    );
  }
}
