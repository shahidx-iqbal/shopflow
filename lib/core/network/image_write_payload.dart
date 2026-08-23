import 'package:dio/dio.dart';

import '../media/picked_image_store.dart';

/// JSON map, or [FormData] when [imagePath] is a newly picked file.
Future<dynamic> imageWritePayload({
  required Map<String, dynamic> fields,
  required String? imagePath,
  required String fileField,
  required String urlField,
  List<String> extraUrlFields = const [],
}) async {
  final payload = Map<String, dynamic>.from(fields)
    ..removeWhere((_, value) => value == null);

  final file = await PickedImageStore.toMultipart(imagePath);
  if (file != null) {
    payload.remove(urlField);
    for (final key in extraUrlFields) {
      payload.remove(key);
    }
    payload[fileField] = file;
    return FormData.fromMap(payload);
  }

  if (!PickedImageStore.isRemoteUrl(imagePath)) {
    payload.remove(urlField);
    for (final key in extraUrlFields) {
      payload.remove(key);
    }
  } else {
    for (final key in extraUrlFields) {
      payload[key] = imagePath;
    }
  }

  return payload;
}
