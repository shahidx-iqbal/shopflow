import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';
import '../cards/app_card.dart';

/// CTA style for [EmptyStateWidget] — filled primary green or outlined secondary.
enum EmptyStateButtonVariant { filled, outlined }

/// Container layout — card with shadow or full-bleed on screen background.
enum EmptyStateLayout { card, fullBleed }

/// Single shared empty-state component for every feature screen.
///
/// Do not build inline Column/Icon/Text empty states in feature code — always
/// use this widget with [AppLocalizations] strings and context-appropriate icons.
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconBackgroundColor,
    this.iconColor,
    this.actionLabel,
    this.actionIcon,
    this.onActionPressed,
    this.buttonVariant = EmptyStateButtonVariant.filled,
    this.layout = EmptyStateLayout.fullBleed,
    super.key,
  });

  final IconData icon;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final EmptyStateButtonVariant buttonVariant;
  final EmptyStateLayout layout;

  static const double _badgeSize = 104;
  static const double _iconSize = 44;

  @override
  Widget build(BuildContext context) {
    final badgeBackground = iconBackgroundColor ?? AppColors.border;
    final badgeIconColor = iconColor ?? AppColors.neutral;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _badgeSize,
          height: _badgeSize,
          decoration: BoxDecoration(
            color: badgeBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: _iconSize, color: badgeIconColor),
        ),
        const SizedBox(height: AppDimensions.space24),
        Text(
          title,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.space12),
        Text(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        if (actionLabel != null && onActionPressed != null) ...[
          const SizedBox(height: AppDimensions.space32),
          _EmptyStatePillButton(
            label: actionLabel!,
            icon: actionIcon,
            variant: buttonVariant,
            onPressed: onActionPressed!,
          ),
        ],
      ],
    );

    final padded = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space32,
        vertical: AppDimensions.space32,
      ),
      child: content,
    );

    return Center(
      child: layout == EmptyStateLayout.card
          ? AppCard(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space32,
                vertical: AppDimensions.space40,
              ),
              margin: const EdgeInsets.all(AppDimensions.pagePadding),
              child: content,
            )
          : padded,
    );
  }
}

class _EmptyStatePillButton extends StatelessWidget {
  const _EmptyStatePillButton({
    required this.label,
    required this.variant,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final IconData? icon;
  final EmptyStateButtonVariant variant;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isFilled = variant == EmptyStateButtonVariant.filled;
    final foreground = isFilled ? Colors.white : AppColors.secondary;
    final background = isFilled ? AppColors.primary : Colors.transparent;
    final borderColor = isFilled ? AppColors.primary : AppColors.secondary;

    return Material(
      color: background,
      shape: StadiumBorder(
        side: BorderSide(color: borderColor, width: isFilled ? 0 : 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space24,
            vertical: AppDimensions.space14,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: foreground),
                const SizedBox(width: AppDimensions.space8),
              ],
              Text(
                label,
                style: AppTextStyles.labelLarge.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
