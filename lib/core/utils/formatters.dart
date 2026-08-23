import 'package:intl/intl.dart';

/// Currency, date, and number formatting helpers.
class Formatters {
  Formatters._();

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: 'Rs. ',
    decimalDigits: 2,
  );

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final DateFormat _timeFormat = DateFormat('hh:mm a');

  /// Formats [amount] with an `Rs.` prefix (e.g. `Rs. 1,250.00`).
  static String currency(num amount) => _currencyFormat.format(amount);

  /// Formats [date] as `dd MMM yyyy`.
  static String date(DateTime date) => _dateFormat.format(date);

  /// Formats [date] as `dd MMM yyyy, hh:mm a`.
  static String dateTime(DateTime date) => _dateTimeFormat.format(date);

  /// Formats [date] as `hh:mm a`.
  static String time(DateTime date) => _timeFormat.format(date);

  /// Formats an integer with thousand separators.
  static String number(num value) => NumberFormat('#,##0').format(value);

  /// Rounds a quantity to 2 decimal places (POS weight/amount back-calc).
  static double roundQuantity(double value) =>
      (value * 100).roundToDouble() / 100;

  /// Rounds a monetary value to 2 decimal places.
  static double roundCurrency(double value) =>
      (value * 100).roundToDouble() / 100;

  /// Formats a cart/receipt quantity (whole numbers without decimals).
  static String quantity(double value) {
    final rounded = roundQuantity(value);
    if (rounded == rounded.roundToDouble()) {
      return number(rounded);
    }
    return rounded.toStringAsFixed(2);
  }
}
