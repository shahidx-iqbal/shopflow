import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/media/picked_image_store.dart';
import '../../../../core/widgets/media/app_cached_image.dart';
import '../../../../core/widgets/media/app_image_picker_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Optional shop logo picker on the registration screen.
class RegisterLogoPicker extends StatelessWidget {
  const RegisterLogoPicker({
    required this.logoPath,
    required this.onLogoChanged,
    super.key,
  });

  final String? logoPath;
  final ValueChanged<String?> onLogoChanged;

  Future<void> _pick(BuildContext context, ImageSource source) async {
    final path = await AppImagePickerActions.pickImage(
      source,
      maxWidth: 512,
    );
    if (path != null) {
      PickedImageStore.forget(logoPath);
      onLogoChanged(path);
    }
  }

  Future<void> _showOptions(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(LucideIcons.image),
              title: Text(l10n.shopLogoGallery),
              onTap: () {
                Navigator.pop(ctx);
                _pick(context, ImageSource.gallery);
              },
            ),
            if (!kIsWeb)
              ListTile(
                leading: const Icon(LucideIcons.camera),
                title: Text(l10n.shopLogoCamera),
                onTap: () {
                  Navigator.pop(ctx);
                  _pick(context, ImageSource.camera);
                },
              ),
            if (logoPath != null && logoPath!.isNotEmpty)
              ListTile(
                leading: const Icon(
                  LucideIcons.trash2,
                  color: AppColors.danger,
                ),
                title: Text(
                  l10n.shopLogoRemove,
                  style: const TextStyle(color: AppColors.danger),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  PickedImageStore.forget(logoPath);
                  onLogoChanged(null);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasLogo = logoPath != null && logoPath!.isNotEmpty;

    return Column(
      children: [
        GestureDetector(
          onTap: () => _showOptions(context),
          child: CustomPaint(
            painter: _DashedCircleBorderPainter(color: AppColors.border),
            child: Container(
              width: 112,
              height: 112,
              margin: const EdgeInsets.all(1.5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surface,
              ),
              child: hasLogo
                  ? ClipOval(
                      child: AppCachedImage(
                        imagePath: logoPath,
                        width: 112,
                        height: 112,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusFull,
                        ),
                        placeholderIcon: LucideIcons.imagePlus,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.imagePlus,
                          color: AppColors.neutral.withValues(alpha: 0.7),
                          size: 28,
                        ),
                        const SizedBox(height: AppDimensions.space8),
                        Text(
                          l10n.registerAddLogo,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.neutral,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.space8),
        Text(
          l10n.labelOptional,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
        ),
      ],
    );
  }
}

class _DashedCircleBorderPainter extends CustomPainter {
  _DashedCircleBorderPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const dashLength = 6.0;
    const gapLength = 4.0;
    final radius = size.width / 2 - paint.strokeWidth;
    final center = Offset(size.width / 2, size.height / 2);
    final circumference = 2 * math.pi * radius;
    final dashCount = (circumference / (dashLength + gapLength)).floor();
    final sweep = (2 * math.pi) / dashCount * (dashLength / (dashLength + gapLength));

    for (var i = 0; i < dashCount; i++) {
      final start = (2 * math.pi / dashCount) * i;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
