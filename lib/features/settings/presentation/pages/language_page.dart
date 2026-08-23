import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../l10n/app_localizations.dart';
import '../cubit/locale_cubit.dart';

/// App language selection — persists locale via [LocaleCubit] / SharedPrefs.
class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppTopBar(
        title: l10n.settingsLanguage,
        showBackButton: true,
      ),
      body: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return ListView(
            padding: const EdgeInsets.all(AppDimensions.pagePadding),
            children: [
              Text(
                l10n.languagePageSubtitle,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
              ),
              const SizedBox(height: AppDimensions.space24),
              _LocaleTile(
                label: l10n.moreLanguageEnglish,
                subtitle: 'English',
                icon: LucideIcons.languages,
                selected: locale.languageCode == 'en',
                onTap: () => _select(context, const Locale('en')),
              ),
              const SizedBox(height: AppDimensions.space12),
              _LocaleTile(
                label: l10n.moreLanguageUrdu,
                subtitle: 'اردو',
                icon: LucideIcons.languages,
                selected: locale.languageCode == 'ur',
                onTap: () => _select(context, const Locale('ur')),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _select(BuildContext context, Locale locale) async {
    final l10n = AppLocalizations.of(context)!;
    await context.read<LocaleCubit>().setLocale(locale);
    if (context.mounted) {
      AppSnackbar.showSuccess(context, l10n.moreLanguageSaved);
    }
  }
}

class _LocaleTile extends StatelessWidget {
  const _LocaleTile({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppDimensions.space16),
      color: selected ? AppColors.primaryLight : null,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(icon, color: AppColors.secondary, size: 20),
          ),
          const SizedBox(width: AppDimensions.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.labelLarge),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          if (selected)
            const Icon(LucideIcons.check, color: AppColors.primary)
          else
            Icon(
              LucideIcons.circle,
              color: AppColors.neutral.withValues(alpha: 0.4),
              size: 20,
            ),
        ],
      ),
    );
  }
}
