import '../config/app_config.dart';

/// Centralized API base URL and endpoint path constants.
class ApiEndpoints {
  ApiEndpoints._();

  static String get baseUrl => AppConfig.apiBaseUrl;

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String verifyOtp = '/auth/verify-otp';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String logout = '/auth/logout';

  // Dashboard
  static const String dashboard = '/dashboard';

  // Products
  static const String products = '/products';
  static String productById(String id) => '/products/$id';
  static String productByBarcode(String barcode) => '/products/barcode/$barcode';

  // Categories
  static const String categories = '/categories';
  static String categoryById(String id) => '/categories/$id';

  // Customers
  static const String customers = '/customers';
  static String customerById(String id) => '/customers/$id';

  // Ledger
  static const String ledger = '/ledger';
  static String ledgerStatement(String customerId) =>
      '/ledger/customers/$customerId';
  static const String recordPayment = '/ledger/payments';

  // Sales
  static const String sales = '/sales';
  static String saleById(String id) => '/sales/$id';

  // Inventory
  static const String inventory = '/inventory';
  static const String stockAdjustment = '/inventory/adjust';

  // Reports
  static const String reports = '/reports';

  // Settings
  static const String settings = '/settings';
}
