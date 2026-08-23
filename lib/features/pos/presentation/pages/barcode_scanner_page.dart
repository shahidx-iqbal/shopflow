import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../l10n/app_localizations.dart';

/// Full-screen barcode scanner returning the scanned value via pop.
class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  bool _handled = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusBarOverlayStyle,
      child: Scaffold(
        appBar: AppTopBar(
          title: l10n.barcodeScannerTitle,
          showBackButton: true,
        ),
        body: Stack(
          children: [
            MobileScanner(
              onDetect: (capture) {
                if (_handled) return;
                final barcodes = capture.barcodes;
                if (barcodes.isEmpty) return;
                final value = barcodes.first.rawValue;
                if (value == null) return;
                _handled = true;
                context.pop(value);
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: AppDimensions.space32,
              child: Text(
                l10n.barcodeScannerHint,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
