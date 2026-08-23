/// Normalizes barcode values for consistent lookup after scanning.
class BarcodeUtils {
  BarcodeUtils._();

  static String normalize(String barcode) => barcode.trim();

  static bool matches(String a, String b) => normalize(a) == normalize(b);
}
