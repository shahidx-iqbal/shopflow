import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/local_storage/shared_prefs_service.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../l10n/app_localizations.dart';

/// Three-step onboarding carousel shown on first launch.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await getIt<SharedPrefsService>().setHasCompletedOnboarding(value: true);
    if (mounted) context.go(RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pages = [
      (LucideIcons.zap, l10n.onboardingTitle1, l10n.onboardingDesc1),
      (LucideIcons.package, l10n.onboardingTitle2, l10n.onboardingDesc2),
      (LucideIcons.trendingUp, l10n.onboardingTitle3, l10n.onboardingDesc3),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: _finish,
                  child: Text(l10n.onboardingSkip),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (_, i) {
                    final (icon, title, desc) = pages[i];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusLarge,
                            ),
                          ),
                          child: Icon(icon, size: 48, color: AppColors.primary),
                        ),
                        const SizedBox(height: AppDimensions.space32),
                        Text(title, style: AppTextStyles.headlineMedium),
                        const SizedBox(height: AppDimensions.space12),
                        Text(
                          desc,
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.neutral),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (i) => Container(
                    width: _index == i ? 24 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _index == i
                          ? AppColors.primary
                          : AppColors.border,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.space24),
              PrimaryButton(
                label: _index == pages.length - 1
                    ? l10n.onboardingGetStarted
                    : l10n.btnNext,
                onPressed: () {
                  if (_index == pages.length - 1) {
                    _finish();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
