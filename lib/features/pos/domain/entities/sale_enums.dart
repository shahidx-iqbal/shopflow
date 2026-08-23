/// Domain enums for sale type, payment status, and lifecycle.
enum SaleType { cash, ledger }

enum PaymentStatus { paid, partiallyPaid, unpaid }

/// Lifecycle status of a completed sale — never deleted, only transitioned.
enum SaleStatus { completed, refunded, voided }
