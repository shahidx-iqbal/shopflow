import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

/// ShopFlow brand block used at the top of auth cards.
class AuthBrandHeader extends StatelessWidget {
  const AuthBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          l10n.appName,
          style: AppTextStyles.headlineLarge.copyWith(color: AppColors.primary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.space8),
        Text(
          l10n.appTagline,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
