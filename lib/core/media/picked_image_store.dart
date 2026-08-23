import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

/// In-memory store for images picked on this device/browser.
///
/// Web cannot use [Image.file] or `MultipartFile.fromFile`. Bytes from
/// [XFile.readAsBytes] work on web, Android, and iOS for both preview and upload.
class PickedImageStore {
  PickedImageStore._();

  static final ImagePicker _picker = ImagePicker();
  static final Map<String, Uint8List> _bytes = {};
  static final Map<String, String> _fileNames = {};

  static bool isRemoteUrl(String? path) {
    if (path == null) return false;
    final value = path.trim().toLowerCase();
    return value.startsWith('http://') || value.startsWith('https://');
  }

  static bool isBrowserUri(String? path) {
    if (path == null) return false;
    final value = path.trim().toLowerCase();
    return value.startsWith('blob:') || value.startsWith('data:');
  }

  static bool needsUpload(String? path) {
    if (path == null || path.trim().isEmpty) return false;
    return !isRemoteUrl(path);
  }

  static Uint8List? bytesFor(String? path) {
    if (path == null || path.isEmpty) return null;
    return _bytes[path];
  }

  static void forget(String? path) {
    if (path == null) return;
    _bytes.remove(path);
    _fileNames.remove(path);
  }

  static Future<String?> pickImage(
    ImageSource source, {
    double maxWidth = 1024,
  }) async {
    final file = await _picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      imageQuality: 85,
    );
    if (file == null) return null;

    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) return null;

    final key = file.path.isNotEmpty
        ? file.path
        : 'picked-${DateTime.now().microsecondsSinceEpoch}';
    _bytes[key] = bytes;
    _fileNames[key] = _safeFileName(file.name, file.mimeType);
    return key;
  }

  static Future<MultipartFile?> toMultipart(
    String? path, {
    String fallbackName = 'image.jpg',
  }) async {
    if (!needsUpload(path)) return null;

    final bytes = _bytes[path] ?? await XFile(path!).readAsBytes();
    if (bytes.isEmpty) return null;

    final name = _fileNames[path] ?? _safeFileName(path, null, fallbackName);
    return MultipartFile.fromBytes(bytes, filename: name);
  }

  static String _safeFileName(
    String? name,
    String? mimeType, [
    String fallback = 'image.jpg',
  ]) {
    final raw = (name ?? '').trim();
    if (raw.isNotEmpty && raw.contains('.') && !raw.startsWith('blob:')) {
      return raw.split(RegExp(r'[/\\]')).last;
    }
    if (mimeType == 'image/png') return 'image.png';
    if (mimeType == 'image/webp') return 'image.webp';
    return fallback;
  }
}
