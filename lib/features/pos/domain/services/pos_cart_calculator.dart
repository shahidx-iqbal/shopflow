import '../../../../core/enums/unit_type.dart';
import '../../../../core/utils/formatters.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../entities/cart_item_entity.dart';

/// Pure cart math for POS — discounts, tax, and quantity-from-amount rules.
class PosCartCalculator {
  PosCartCalculator._();

  static double lineGross(CartItemEntity item) =>
      Formatters.roundCurrency(item.unitPrice * item.quantity);

  static double clampItemDiscount(CartItemEntity item, double discount) {
    final gross = lineGross(item);
    return discount.clamp(0, gross).toDouble();
  }

  static double lineTotal(CartItemEntity item) =>
      Formatters.roundCurrency(lineGross(item) - item.discount);

  static double itemsSubtotal(List<CartItemEntity> items) => Formatters.roundCurrency(
        items.fold(0, (sum, item) => sum + lineTotal(item)),
      );

  static double taxableSubtotal(double itemsSubtotal, double cartDiscount) =>
      Formatters.roundCurrency(
        (itemsSubtotal - cartDiscount.clamp(0, itemsSubtotal))
            .clamp(0, double.infinity),
      );

  static double taxAmount({
    required double taxableSubtotal,
    required double taxRate,
    required bool taxEnabled,
  }) {
    if (!taxEnabled || taxRate <= 0) return 0;
    return Formatters.roundCurrency(taxableSubtotal * taxRate);
  }

  static double grandTotal({
    required List<CartItemEntity> items,
    required double cartDiscount,
    required double taxRate,
    required bool taxEnabled,
  }) {
    final subtotal = itemsSubtotal(items);
    final taxable = taxableSubtotal(subtotal, cartDiscount);
    final tax = taxAmount(
      taxableSubtotal: taxable,
      taxRate: taxRate,
      taxEnabled: taxEnabled,
    );
    return Formatters.roundCurrency(taxable + tax);
  }

  static double clampCartDiscount(double itemsSubtotal, double discount) =>
      discount.clamp(0, itemsSubtotal).toDouble();

  /// Back-calculates quantity when customer buys by amount (e.g. Rs. 300 of rice).
  static double quantityFromAmount({
    required double amount,
    required double pricePerUnit,
  }) {
    if (pricePerUnit <= 0 || amount <= 0) return 0;
    return Formatters.roundQuantity(amount / pricePerUnit);
  }

  static double normalizeQuantity({
    required UnitType unit,
    required double quantity,
  }) {
    final rounded = Formatters.roundQuantity(quantity);
    if (unit.allowsDecimalQuantity) return rounded;
    return rounded.roundToDouble().clamp(1, double.infinity);
  }

  static double availableStock(ProductEntity product) => product.stock.toDouble();

  static CartItemEntity fromProduct({
    required ProductEntity product,
    required double quantity,
    double discount = 0,
  }) {
    final unit = UnitType.fromString(product.unit);
    final normalizedQty = normalizeQuantity(unit: unit, quantity: quantity);
    final gross = Formatters.roundCurrency(product.price * normalizedQty);
    return CartItemEntity(
      productId: product.id,
      productName: product.name,
      barcode: product.barcode,
      unit: product.unit,
      unitPrice: product.price,
      quantity: normalizedQty,
      discount: discount.clamp(0, gross).toDouble(),
    );
  }
}
