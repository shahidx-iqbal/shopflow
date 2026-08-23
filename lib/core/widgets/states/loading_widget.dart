import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';

/// Centered loading indicator using the primary brand color.
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          if (message != null) ...[
            const SizedBox(height: AppDimensions.space16),
            Text(message!),
          ],
        ],
      ),
    );
  }
}
