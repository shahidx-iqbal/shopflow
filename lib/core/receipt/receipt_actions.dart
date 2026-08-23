import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../di/injection_container.dart';
import '../usecase/usecase.dart';
import '../../features/pos/domain/entities/sale_entity.dart';
import '../../features/settings/domain/entities/receipt_settings_entity.dart';
import '../../features/settings/domain/usecases/get_receipt_settings_usecase.dart';
import '../../features/shop/domain/entities/shop_profile_entity.dart';
import '../../features/shop/domain/usecases/get_shop_profile_usecase.dart';
import '../../l10n/app_localizations.dart';
import 'receipt_data.dart';
import 'receipt_image_capture.dart';
import 'receipt_template_builder.dart';
import 'receipt_text_builder.dart';

/// Loads receipt data and handles share / download for any completed sale.
class ReceiptActions {
  ReceiptActions._();

  static Future<ReceiptData> buildReceiptData(
    SaleEntity sale,
    AppLocalizations l10n, {
    ReceiptSettingsEntity? settingsOverride,
  }) async {
    final settingsResult =
        await getIt<GetReceiptSettingsUseCase>()(const NoParams());
    final shopResult = await getIt<GetShopProfileUseCase>()(const NoParams());

    final ReceiptSettingsEntity settings = settingsOverride ??
        settingsResult.fold(
          (_) => const ReceiptSettingsEntity(),
          (value) => value,
        );
    final shop = shopResult.fold(
      (_) => const ShopProfileEntity(
        shopName: 'ShopFlow',
        ownerName: 'Cashier',
        phone: '',
      ),
      (value) => value,
    );

    return ReceiptTemplateBuilder.build(
      sale: sale,
      settings: settings,
      shop: shop,
      l10n: l10n,
    );
  }

  static Future<void> shareText(
    SaleEntity sale,
    AppLocalizations l10n,
  ) async {
    final data = await buildReceiptData(sale, l10n);
    await Share.share(ReceiptTextBuilder.build(data));
  }

  static Future<void> downloadImage({
    required GlobalKey receiptKey,
    required String fileName,
  }) async {
    final bytes = await ReceiptImageCapture.capture(receiptKey);
    if (bytes == null) return;

    final directory = await getTemporaryDirectory();
    final sanitized = fileName.replaceAll(RegExp(r'[^\w\-]'), '_');
    final file = File('${directory.path}/$sanitized.png');
    await file.writeAsBytes(bytes, flush: true);

    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'image/png')],
      subject: sanitized,
    );
  }
}
