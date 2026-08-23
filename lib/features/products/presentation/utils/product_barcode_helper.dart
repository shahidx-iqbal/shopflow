import '../../../../core/di/injection_container.dart';
import '../../domain/usecases/check_barcode_exists_usecase.dart';

/// Duplicate barcode checks shared by add/edit product forms.
class ProductBarcodeHelper {
  ProductBarcodeHelper._();

  static Future<bool> isDuplicate(
    String barcode, {
    String? excludeProductId,
  }) async {
    final trimmed = barcode.trim();
    if (trimmed.isEmpty) return false;

    final result = await getIt<CheckBarcodeExistsUseCase>()(
      CheckBarcodeExistsParams(
        barcode: trimmed,
        excludeProductId: excludeProductId,
      ),
    );

    return result.fold((_) => false, (exists) => exists);
  }
}
