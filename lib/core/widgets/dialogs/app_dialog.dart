import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';

/// Semantic tone for the circular icon badge at the top of [AppDialog].
enum AppDialogIconVariant {
  danger,
  warning,
  success,
  info,
  neutral,
}

/// Action layout for dialog footer buttons.
enum AppDialogActionsLayout {
  /// Cancel + primary side by side (delete, product not found).
  row,

  /// Primary only, full width (stock warning, no connection).
  primaryOnly,

  /// Stacked: outlined secondary on top, filled primary below (payment success).
  stacked,
}

/// Shared dialog component matching the ShopFlow Dialog Library.
///
/// Every confirmation, warning, success, and error dialog in the app must use
/// this widget — never build raw [AlertDialog] in feature code.
class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    this.subtitle,
    this.icon,
    this.iconVariant = AppDialogIconVariant.neutral,
    this.content,
    this.primaryLabel,
    this.primaryIcon,
    this.onPrimary,
    this.primaryColor,
    this.secondaryLabel,
    this.onSecondary,
    this.secondaryIcon,
    this.actionsLayout = AppDialogActionsLayout.row,
    this.barrierDismissible = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final AppDialogIconVariant iconVariant;
  final Widget? content;
  final String? primaryLabel;
  final IconData? primaryIcon;
  final VoidCallback? onPrimary;
  final Color? primaryColor;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final IconData? secondaryIcon;
  final AppDialogActionsLayout actionsLayout;
  final bool barrierDismissible;

  static const double _badgeSize = 56;

  /// Delete confirmation — red badge, cancel + destructive confirm.
  static Future<bool?> showDelete({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
  }) {
    return show<bool>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        subtitle: message,
        icon: LucideIcons.triangleAlert,
        iconVariant: AppDialogIconVariant.danger,
        primaryLabel: confirmLabel,
        onPrimary: () => Navigator.of(ctx).pop(true),
        primaryColor: AppColors.danger,
        secondaryLabel: cancelLabel,
        onSecondary: () => Navigator.of(ctx).pop(false),
        actionsLayout: AppDialogActionsLayout.row,
      ),
    );
  }

  /// Generic confirm / cancel dialog.
  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
    bool isDestructive = false,
  }) {
    return show<bool>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        subtitle: message,
        icon: isDestructive ? LucideIcons.triangleAlert : LucideIcons.info,
        iconVariant: isDestructive
            ? AppDialogIconVariant.danger
            : AppDialogIconVariant.info,
        primaryLabel: confirmLabel,
        onPrimary: () => Navigator.of(ctx).pop(true),
        primaryColor: isDestructive ? AppColors.danger : AppColors.primary,
        secondaryLabel: cancelLabel,
        onSecondary: () => Navigator.of(ctx).pop(false),
        actionsLayout: AppDialogActionsLayout.row,
      ),
    );
  }

  /// Low-stock warning with optional item list and single CTA.
  static Future<void> showStockWarning({
    required BuildContext context,
    required String title,
    required String confirmLabel,
    required List<String> items,
    VoidCallback? onConfirm,
  }) {
    return show<void>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        icon: LucideIcons.package,
        iconVariant: AppDialogIconVariant.warning,
        content: _StockWarningList(items: items),
        primaryLabel: confirmLabel,
        primaryColor: AppColors.tertiary,
        onPrimary: () {
          Navigator.of(ctx).pop();
          onConfirm?.call();
        },
        actionsLayout: AppDialogActionsLayout.primaryOnly,
      ),
    );
  }

  /// Payment success with amount highlight and stacked actions.
  static Future<void> showPaymentSuccess({
    required BuildContext context,
    required String title,
    required String amount,
    required String primaryLabel,
    required String secondaryLabel,
    VoidCallback? onPrimary,
    VoidCallback? onSecondary,
  }) {
    return show<void>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        icon: LucideIcons.circleCheck,
        iconVariant: AppDialogIconVariant.success,
        content: Text(
          amount,
          style: AppTextStyles.numberLarge.copyWith(color: AppColors.primary),
          textAlign: TextAlign.center,
        ),
        primaryLabel: primaryLabel,
        onPrimary: () {
          Navigator.of(ctx).pop();
          onPrimary?.call();
        },
        secondaryLabel: secondaryLabel,
        secondaryIcon: LucideIcons.printer,
        onSecondary: () {
          Navigator.of(ctx).pop();
          onSecondary?.call();
        },
        actionsLayout: AppDialogActionsLayout.stacked,
      ),
    );
  }

  /// Connection / retry error dialog.
  static Future<void> showRetry({
    required BuildContext context,
    required String title,
    required String message,
    required String retryLabel,
    VoidCallback? onRetry,
  }) {
    return show<void>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        subtitle: message,
        icon: LucideIcons.cloudOff,
        iconVariant: AppDialogIconVariant.info,
        primaryLabel: retryLabel,
        primaryIcon: LucideIcons.refreshCw,
        onPrimary: () {
          Navigator.of(ctx).pop();
          onRetry?.call();
        },
        actionsLayout: AppDialogActionsLayout.primaryOnly,
      ),
    );
  }

  /// Barcode scan — product not found.
  static Future<bool?> showProductNotFound({
    required BuildContext context,
    required String title,
    required String message,
    required String dismissLabel,
    required String createLabel,
  }) {
    return show<bool>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        subtitle: message,
        icon: LucideIcons.scanBarcode,
        iconVariant: AppDialogIconVariant.info,
        primaryLabel: createLabel,
        primaryIcon: LucideIcons.plus,
        onPrimary: () => Navigator.of(ctx).pop(true),
        secondaryLabel: dismissLabel,
        onSecondary: () => Navigator.of(ctx).pop(false),
        actionsLayout: AppDialogActionsLayout.row,
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  Color _badgeBackground() {
    return switch (iconVariant) {
      AppDialogIconVariant.danger => AppColors.dangerLight,
      AppDialogIconVariant.warning => AppColors.tertiaryLight,
      AppDialogIconVariant.success => AppColors.primaryLight,
      AppDialogIconVariant.info => AppColors.secondaryLight,
      AppDialogIconVariant.neutral => AppColors.border,
    };
  }

  Color _badgeIconColor() {
    return switch (iconVariant) {
      AppDialogIconVariant.danger => AppColors.danger,
      AppDialogIconVariant.warning => AppColors.tertiary,
      AppDialogIconVariant.success => AppColors.primary,
      AppDialogIconVariant.info => AppColors.secondary,
      AppDialogIconVariant.neutral => AppColors.neutral,
    };
  }

  @override
  Widget build(BuildContext context) {
    final effectivePrimary = primaryColor ?? AppColors.primary;

    return Dialog(
      backgroundColor: AppColors.surface,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimensions.space24,
          AppDimensions.space32,
          AppDimensions.space24,
          AppDimensions.space24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Container(
                width: _badgeSize,
                height: _badgeSize,
                decoration: BoxDecoration(
                  color: _badgeBackground(),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 26, color: _badgeIconColor()),
              ),
              const SizedBox(height: AppDimensions.space20),
            ],
            Text(
              title,
              style: AppTextStyles.headlineSmall,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppDimensions.space12),
              Text(
                subtitle!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.neutral,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (content != null) ...[
              const SizedBox(height: AppDimensions.space16),
              content!,
            ],
            const SizedBox(height: AppDimensions.space24),
            _DialogActions(
              layout: actionsLayout,
              primaryLabel: primaryLabel,
              primaryIcon: primaryIcon,
              onPrimary: onPrimary,
              primaryColor: effectivePrimary,
              secondaryLabel: secondaryLabel,
              secondaryIcon: secondaryIcon,
              onSecondary: onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _StockWarningList extends StatelessWidget {
  const _StockWarningList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.space16),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.space8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: AppColors.neutral)),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DialogActions extends StatelessWidget {
  const _DialogActions({
    required this.layout,
    this.primaryLabel,
    this.primaryIcon,
    this.onPrimary,
    this.primaryColor,
    this.secondaryLabel,
    this.secondaryIcon,
    this.onSecondary,
  });

  final AppDialogActionsLayout layout;
  final String? primaryLabel;
  final IconData? primaryIcon;
  final VoidCallback? onPrimary;
  final Color? primaryColor;
  final String? secondaryLabel;
  final IconData? secondaryIcon;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    if (primaryLabel == null && secondaryLabel == null) {
      return const SizedBox.shrink();
    }

    final primary = primaryLabel != null
        ? _DialogPillButton(
            label: primaryLabel!,
            icon: primaryIcon,
            onPressed: onPrimary,
            backgroundColor: primaryColor ?? AppColors.primary,
            foregroundColor: Colors.white,
            filled: true,
          )
        : null;

    final secondary = secondaryLabel != null
        ? _DialogPillButton(
            label: secondaryLabel!,
            icon: secondaryIcon,
            onPressed: onSecondary,
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.textPrimary,
            borderColor: AppColors.border,
            filled: false,
          )
        : null;

    return switch (layout) {
      AppDialogActionsLayout.primaryOnly => SizedBox(
          width: double.infinity,
          child: primary,
        ),
      AppDialogActionsLayout.stacked => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (secondary != null) secondary,
            if (secondary != null && primary != null)
              const SizedBox(height: AppDimensions.space12),
            if (primary != null) primary,
          ],
        ),
      AppDialogActionsLayout.row => Row(
          children: [
            if (secondary != null) Expanded(child: secondary),
            if (secondary != null && primary != null)
              const SizedBox(width: AppDimensions.space12),
            if (primary != null) Expanded(child: primary),
          ],
        ),
    };
  }
}

class _DialogPillButton extends StatelessWidget {
  const _DialogPillButton({
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.filled,
    this.icon,
    this.borderColor,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: StadiumBorder(
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 1.5)
            : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space16,
            vertical: AppDimensions.space14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: foregroundColor),
                const SizedBox(width: AppDimensions.space8),
              ],
              Flexible(
                child: Text(
                  label,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: foregroundColor,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
