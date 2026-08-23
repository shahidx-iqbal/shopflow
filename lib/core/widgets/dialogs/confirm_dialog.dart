import 'package:flutter/material.dart';

import 'app_dialog.dart';

/// Reusable confirmation dialog — delegates to [AppDialog].
class ConfirmDialog {
  ConfirmDialog._();

  /// Shows the dialog and returns `true` if confirmed, `false`/`null` otherwise.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
    bool isDestructive = false,
  }) {
    return isDestructive
        ? AppDialog.showDelete(
            context: context,
            title: title,
            message: message,
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
          )
        : AppDialog.showConfirm(
            context: context,
            title: title,
            message: message,
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
          );
  }
}
