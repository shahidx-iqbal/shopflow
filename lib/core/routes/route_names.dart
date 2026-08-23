/// Route path constants for go_router navigation.
/// Paths use kebab-case; constant names use lowerCamelCase.
class RouteNames {
  RouteNames._();

  // Auth
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String otpVerification = '/auth/otp';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';

  // Dashboard
  static const String dashboard = '/dashboard';
  static const String more = '/more';

  // POS
  static const String posCheckout = '/pos/checkout';
  static const String barcodeScanner = '/pos/scanner';

  // Products
  static const String productList = '/products';
  static const String addProduct = '/products/add';
  static const String editProduct = '/products/:id/edit';
  static const String productDetails = '/products/:id';

  // Categories
  static const String categoryList = '/categories';

  // Customers
  static const String customerList = '/customers';
  static const String addCustomer = '/customers/add';
  static const String customerDetails = '/customers/:id';

  // Ledger
  static const String ledgerList = '/ledger';
  static const String ledgerStatement = '/ledger/:customerId';
  static const String recordPayment = '/ledger/:customerId/payment';

  // Sales History
  static const String salesHistory = '/sales';
  static const String invoiceDetails = '/sales/:id';

  // Inventory
  static const String inventory = '/inventory';
  static const String stockAdjustment = '/inventory/adjust';

  // Reports
  static const String reports = '/reports';

  // Settings / More sub-screens
  static const String shopProfile = '/more/shop-profile';
  static const String receiptSettings = '/more/receipt-settings';
  static const String language = '/more/language';
  static const String about = '/more/about';
  static const String settings = '/settings';

  // Main shell tab roots — bottom nav visible only on these paths.
  static const List<String> tabRootRoutes = [
    dashboard,
    salesHistory,
    inventory,
    more,
  ];

  static bool isTabRoot(String path) => tabRootRoutes.contains(path);
  static String editProductPath(String id) => '/products/$id/edit';
  static String productDetailsPath(String id) => '/products/$id';
  static String customerDetailsPath(String id) => '/customers/$id';
  static String ledgerStatementPath(String customerId) =>
      '/ledger/$customerId';
  static String recordPaymentPath(String customerId) =>
      '/ledger/$customerId/payment';
  static String invoiceDetailsPath(String id) => '/sales/$id';
}
