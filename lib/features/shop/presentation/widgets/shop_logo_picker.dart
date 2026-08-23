import 'package:flutter/material.dart';

import '../../../../core/widgets/media/app_image_picker_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Shop logo picker — circular avatar with camera/gallery options.
class ShopLogoPicker extends StatelessWidget {
  const ShopLogoPicker({
    required this.logoPath,
    required this.onLogoChanged,
    super.key,
  });

  final String? logoPath;
  final ValueChanged<String?> onLogoChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppImagePickerField(
      imagePath: logoPath,
      onImageChanged: onLogoChanged,
      shape: AppImagePickerShape.circle,
      maxImageWidth: 512,
      removeLabel: l10n.shopLogoRemove,
    );
  }
}
