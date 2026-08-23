import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import 'dashboard_summary_section.dart';

/// Dashboard header — primary card with bottom radius on mobile, full bar on desktop.
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    required this.shopName,
    required this.isDesktop,
    this.summary,
    this.onNewSale,
    super.key,
  });

  final String shopName;
  final bool isDesktop;
  final DashboardSummaryEntity? summary;
  final VoidCallback? onNewSale;

  String _greeting(AppLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 12) return l10n.dashboardGoodMorning;
    if (hour < 17) return l10n.dashboardGoodAfternoon;
    return l10n.dashboardGoodEvening;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_greeting(l10n)}, $shopName',
                  style: AppTextStyles.headlineLarge,
                ),
                const SizedBox(height: AppDimensions.space4),
                Text(l10n.dashboardSubtitle, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
          SizedBox(
            width: 320,
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.dashboardSearchHint,
                prefixIcon: const Icon(LucideIcons.search, size: 20),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.space16,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.space16),
          FilledButton.icon(
            onPressed: onNewSale,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space20,
                vertical: AppDimensions.space16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
            ),
            icon: const Icon(LucideIcons.plus, color: Colors.white),
            label: Text(
              l10n.dashboardNewSale,
              style: AppTextStyles.labelMedium.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: AppDimensions.space16),
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryLight,
            child: Text(
              shopName.isNotEmpty ? shopName[0].toUpperCase() : 'S',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      );
    }

    final topInset = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusBarOverlayStyle,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.radiusLarge),
            bottomRight: Radius.circular(AppDimensions.radiusLarge),
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          AppDimensions.pagePadding,
          topInset + AppDimensions.space16,
          AppDimensions.pagePadding,
          AppDimensions.space24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _greeting(l10n).toUpperCase(),
                        style: AppTextStyles.labelSmall.copyWith(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space4),
                      Text(
                        shopName,
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimensions.space10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusMedium),
                  ),
                  child: const Icon(LucideIcons.store, color: Colors.white),
                ),
              ],
            ),
            if (summary != null) ...[
              const SizedBox(height: AppDimensions.space24),
              DashboardSummarySection(
                summary: summary!,
                isDesktop: false,
                embeddedInPrimaryCard: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
