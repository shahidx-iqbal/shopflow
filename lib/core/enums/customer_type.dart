/// Saved customer payment profile — independent of anonymous walk-in sales.
enum CustomerType {
  cash,
  ledger;

  String get label => switch (this) {
        CustomerType.cash => 'Cash Customer',
        CustomerType.ledger => 'Ledger Customer',
      };

  static CustomerType fromString(String? raw) {
    return switch (raw?.toLowerCase()) {
      'cash' => CustomerType.cash,
      'ledger' => CustomerType.ledger,
      _ => CustomerType.ledger,
    };
  }
}
