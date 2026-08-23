import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../media/picked_image_store.dart';
import 'app_cached_image.dart';

enum AppImagePickerShape { rectangle, circle }

/// Reusable image picker — camera/gallery sheet, local path or URL preview.
class AppImagePickerField extends StatelessWidget {
  const AppImagePickerField({
    required this.imagePath,
    required this.onImageChanged,
    this.shape = AppImagePickerShape.rectangle,
    this.placeholderText,
    this.placeholderIcon = LucideIcons.camera,
    this.height = 160,
    this.circleRadius = 48,
    this.maxImageWidth = 1024,
    this.removeLabel,
    super.key,
  });

  final String? imagePath;
  final ValueChanged<String?> onImageChanged;
  final AppImagePickerShape shape;
  final String? placeholderText;
  final IconData placeholderIcon;
  final double height;
  final double circleRadius;
  final double maxImageWidth;
  final String? removeLabel;

  Future<void> _pick(BuildContext context, ImageSource source) async {
    final path = await AppImagePickerActions.pickImage(
      source,
      maxWidth: maxImageWidth,
    );
    if (path != null) {
      PickedImageStore.forget(imagePath);
      onImageChanged(path);
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
            if (imagePath != null && imagePath!.isNotEmpty)
              ListTile(
                leading: const Icon(LucideIcons.trash2, color: AppColors.danger),
                title: Text(
                  removeLabel ?? l10n.imagePickerRemove,
                  style: const TextStyle(color: AppColors.danger),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  PickedImageStore.forget(imagePath);
                  onImageChanged(null);
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
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    if (shape == AppImagePickerShape.circle) {
      return Center(
        child: GestureDetector(
          onTap: () => _showOptions(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AppCachedImage(
                imagePath: imagePath,
                width: circleRadius * 2,
                height: circleRadius * 2,
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                placeholderIcon: LucideIcons.store,
                backgroundColor: AppColors.primaryLight,
              ),
              Positioned(
                right: -4,
                bottom: -4,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.camera,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Material(
      color: AppColors.secondaryLight,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showOptions(context),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.35),
              width: 1.5,
            ),
          ),
          child: hasImage
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    AppCachedImage(
                      imagePath: imagePath,
                      width: double.infinity,
                      height: height,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                      placeholderIcon: placeholderIcon,
                    ),
                    Positioned(
                      right: AppDimensions.space12,
                      bottom: AppDimensions.space12,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary.withValues(alpha: 0.65),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          LucideIcons.camera,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      placeholderIcon,
                      color: AppColors.secondary,
                      size: 32,
                    ),
                    const SizedBox(height: AppDimensions.space8),
                    Text(
                      placeholderText ?? l10n.productPhotoHint,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Shared image_picker helpers for [AppImagePickerField].
class AppImagePickerActions {
  AppImagePickerActions._();

  static Future<String?> pickImage(
    ImageSource source, {
    double maxWidth = 1024,
  }) {
    return PickedImageStore.pickImage(source, maxWidth: maxWidth);
  }
}
