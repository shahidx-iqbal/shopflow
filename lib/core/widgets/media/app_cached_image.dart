import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../constants/app_colors.dart';
import '../../media/picked_image_store.dart';

/// Displays a local file, picked bytes, blob URL, or remote URL.
class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderIcon = LucideIcons.image,
    this.backgroundColor,
    super.key,
  });

  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData placeholderIcon;
  final Color? backgroundColor;

  bool get _hasImage => imagePath != null && imagePath!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.zero;

    Widget child;
    if (!_hasImage) {
      child = _placeholder();
    } else {
      child = _imageFor(imagePath!);
    }

    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }

  Widget _imageFor(String path) {
    final bytes = PickedImageStore.bytesFor(path);
    if (bytes != null) {
      return Image.memory(
        bytes,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }

    if (PickedImageStore.isRemoteUrl(path)) {
      return CachedNetworkImage(
        imageUrl: path,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) => _placeholder(showProgress: true),
        errorWidget: (_, __, ___) => _placeholder(),
      );
    }

    if (kIsWeb || PickedImageStore.isBrowserUri(path)) {
      return Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }

    return Image.file(
      File(path),
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => _placeholder(),
    );
  }

  Widget _placeholder({bool showProgress = false}) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor ?? AppColors.secondaryLight,
      alignment: Alignment.center,
      child: showProgress
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              placeholderIcon,
              color: AppColors.secondary.withValues(alpha: 0.7),
              size: 32,
            ),
    );
  }
}
