import 'package:go_router/go_router.dart';
import 'package:shopflow/features/ledger/presentation/pages/ledger_list_page.dart';

import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/models/otp_route_args.dart';
import '../../features/categories/presentation/pages/category_list_page.dart';
import '../../features/customers/presentation/pages/add_customer_page.dart';
import '../../features/customers/domain/entities/customer_entity.dart';
import '../../features/customers/presentation/pages/customer_details_page.dart';
import '../../features/customers/presentation/pages/customer_list_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/inventory/presentation/pages/stock_adjustment_page.dart';
import '../../features/more/presentation/pages/more_page.dart';
import '../../features/ledger/presentation/pages/ledger_statement_page.dart';
import '../../features/ledger/presentation/pages/record_payment_page.dart';
import '../../features/pos/presentation/pages/barcode_scanner_page.dart';
import '../../features/pos/presentation/pages/pos_checkout_page.dart';
import '../../features/products/domain/entities/product_entity.dart';
import '../../features/products/presentation/pages/add_product_page.dart';
import '../../features/products/presentation/pages/edit_product_page.dart';
import '../../features/products/presentation/pages/product_details_page.dart';
import '../../features/products/presentation/pages/product_list_page.dart';
import '../../features/reports/presentation/pages/reports_page.dart';
import '../../features/sales_history/presentation/pages/invoice_details_page.dart';
import '../../features/sales_history/presentation/pages/sales_history_page.dart';
import '../../features/settings/presentation/pages/about_page.dart';
import '../../features/settings/presentation/pages/language_page.dart';
import '../../features/settings/presentation/pages/receipt_settings_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/shop/presentation/pages/shop_profile_page.dart';
import '../widgets/layout/app_shell.dart';
import 'product_details_route_args.dart';
import 'route_names.dart';

/// go_router configuration for all ShopFlow screens.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (_, __) => const OnboardingPage(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (_, __) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteNames.otpVerification,
        builder: (_, state) {
          final extra = state.extra;
          if (extra is OtpRouteArgs) {
            return OtpVerificationPage(
              phone: extra.phone,
              purpose: extra.purpose,
              debugOtp: extra.debugOtp,
            );
          }
          return OtpVerificationPage(
            phone: extra as String? ?? '',
            purpose: OtpPurpose.registration,
          );
        },
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (_, __) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: RouteNames.resetPassword,
        builder: (_, state) => ResetPasswordPage(
          phone: state.extra as String? ?? '',
        ),
      ),
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: RouteNames.dashboard,
            builder: (_, __) => const DashboardPage(),
          ),
          GoRoute(
            path: RouteNames.more,
            builder: (_, __) => const MorePage(),
          ),
          GoRoute(
            path: RouteNames.posCheckout,
            builder: (_, __) => const PosCheckoutPage(),
          ),
          GoRoute(
            path: RouteNames.barcodeScanner,
            builder: (_, __) => const BarcodeScannerPage(),
          ),
          GoRoute(
            path: RouteNames.productList,
            builder: (_, __) => const ProductListPage(),
          ),
          GoRoute(
            path: RouteNames.addProduct,
            builder: (_, state) => AddProductPage(
              initialBarcode: state.extra as String?,
            ),
          ),
          GoRoute(
            path: RouteNames.editProduct,
            builder: (_, state) => EditProductPage(
              productId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: RouteNames.productDetails,
            builder: (_, state) {
              final extra = state.extra;
              final args = extra is ProductDetailsRouteArgs ? extra : null;
              return ProductDetailsPage(
                productId: state.pathParameters['id']!,
                posMode: args?.posMode ?? false,
                onPosAddToCart: args?.onAddToCart,
              );
            },
          ),
          GoRoute(
            path: RouteNames.categoryList,
            builder: (_, __) => const CategoryListPage(),
          ),
          GoRoute(
            path: RouteNames.customerList,
            builder: (_, __) => const CustomerListPage(),
          ),
          GoRoute(
            path: RouteNames.addCustomer,
            builder: (_, state) => AddCustomerPage(
              customer: state.extra as CustomerEntity?,
            ),
          ),
          GoRoute(
            path: RouteNames.customerDetails,
            builder: (_, state) => CustomerDetailsPage(
              customerId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: RouteNames.ledgerList,
            builder: (_, __) => const LedgerListPage(),
          ),
          GoRoute(
            path: RouteNames.ledgerStatement,
            builder: (_, state) => LedgerStatementPage(
              customerId: state.pathParameters['customerId']!,
            ),
          ),
          GoRoute(
            path: RouteNames.recordPayment,
            builder: (_, state) => RecordPaymentPage(
              customerId: state.pathParameters['customerId']!,
            ),
          ),
          GoRoute(
            path: RouteNames.salesHistory,
            builder: (_, __) => const SalesHistoryPage(),
          ),
          GoRoute(
            path: RouteNames.invoiceDetails,
            builder: (_, state) => InvoiceDetailsPage(
              saleId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: RouteNames.inventory,
            builder: (_, __) => const InventoryPage(),
          ),
          GoRoute(
            path: RouteNames.stockAdjustment,
            builder: (_, state) => StockAdjustmentPage(
              product: state.extra as ProductEntity,
            ),
          ),
          GoRoute(
            path: RouteNames.reports,
            builder: (_, __) => const ReportsPage(),
          ),
          GoRoute(
            path: RouteNames.shopProfile,
            builder: (_, __) => const ShopProfilePage(),
          ),
          GoRoute(
            path: RouteNames.receiptSettings,
            builder: (_, __) => const ReceiptSettingsPage(),
          ),
          GoRoute(
            path: RouteNames.language,
            builder: (_, __) => const LanguagePage(),
          ),
          GoRoute(
            path: RouteNames.about,
            builder: (_, __) => const AboutPage(),
          ),
          GoRoute(
            path: RouteNames.settings,
            builder: (_, __) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
}
