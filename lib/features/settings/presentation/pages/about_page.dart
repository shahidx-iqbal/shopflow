import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';

/// About ShopFlow — version and app description.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppTopBar(
        title: l10n.settingsAbout,
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.pagePadding),
        children: [
          AppCard(
            padding: const EdgeInsets.all(AppDimensions.space24),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusLarge),
                  ),
                  child: const Icon(
                    LucideIcons.store,
                    size: 36,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppDimensions.space16),
                Text(l10n.appName, style: AppTextStyles.headlineMedium),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  '${l10n.settingsVersion} 1.0.0',
                  style: AppTextStyles.bodySmall,
                ),
                const SizedBox(height: AppDimensions.space16),
                Text(
                  l10n.moreAboutDescription,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.neutral,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
