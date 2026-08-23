import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Captures a [RepaintBoundary] widget as a PNG byte array.
class ReceiptImageCapture {
  ReceiptImageCapture._();

  static Future<Uint8List?> capture(GlobalKey boundaryKey) async {
    final context = boundaryKey.currentContext;
    if (context == null) return null;

    final boundary = context.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return null;

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }
}
