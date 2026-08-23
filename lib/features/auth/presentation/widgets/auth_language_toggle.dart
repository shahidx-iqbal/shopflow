import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../settings/presentation/cubit/locale_cubit.dart';

/// Compact EN / Urdu toggle for auth screens.
class AuthLanguageToggle extends StatelessWidget {
  const AuthLanguageToggle({super.key});

  Future<void> _select(BuildContext context, Locale locale) async {
    final current = context.read<LocaleCubit>().state;
    if (current.languageCode == locale.languageCode) return;
    await context.read<LocaleCubit>().setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        final isEnglish = locale.languageCode == 'en';

        return Container(
          height: 36,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageChip(
                label: 'EN',
                selected: isEnglish,
                onTap: () => _select(context, const Locale('en')),
              ),
              _LanguageChip(
                label: 'اردو',
                selected: !isEnglish,
                onTap: () => _select(context, const Locale('ur')),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall - 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space12,
            vertical: AppDimensions.space4,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall - 2),
          ),
          child: Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: selected ? Colors.white : AppColors.neutral,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
