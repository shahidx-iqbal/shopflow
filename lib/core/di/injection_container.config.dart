// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasource/auth_datasource.dart' as _i43;
import '../../features/auth/data/datasource/auth_remote_datasource.dart'
    as _i175;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i560;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i474;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/categories/data/datasource/category_datasource.dart'
    as _i1010;
import '../../features/categories/data/datasource/category_remote_datasource.dart'
    as _i1028;
import '../../features/categories/data/repositories/category_repository_impl.dart'
    as _i894;
import '../../features/categories/domain/repositories/category_repository.dart'
    as _i266;
import '../../features/categories/domain/usecases/add_category_usecase.dart'
    as _i374;
import '../../features/categories/domain/usecases/delete_category_usecase.dart'
    as _i1007;
import '../../features/categories/domain/usecases/get_categories_usecase.dart'
    as _i76;
import '../../features/categories/domain/usecases/update_category_usecase.dart'
    as _i656;
import '../../features/categories/presentation/cubit/categories_cubit.dart'
    as _i802;
import '../../features/customers/data/datasource/customer_datasource.dart'
    as _i92;
import '../../features/customers/data/datasource/customer_remote_datasource.dart'
    as _i640;
import '../../features/customers/data/repositories/customer_repository_impl.dart'
    as _i877;
import '../../features/customers/domain/repositories/customer_repository.dart'
    as _i504;
import '../../features/customers/domain/usecases/add_customer_usecase.dart'
    as _i863;
import '../../features/customers/domain/usecases/delete_customer_usecase.dart'
    as _i270;
import '../../features/customers/domain/usecases/get_customer_by_id_usecase.dart'
    as _i469;
import '../../features/customers/domain/usecases/get_customers_usecase.dart'
    as _i831;
import '../../features/customers/domain/usecases/update_customer_usecase.dart'
    as _i940;
import '../../features/customers/presentation/bloc/customers_bloc.dart' as _i19;
import '../../features/dashboard/data/datasource/dashboard_datasource.dart'
    as _i556;
import '../../features/dashboard/data/datasource/dashboard_remote_datasource.dart'
    as _i454;
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i509;
import '../../features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i665;
import '../../features/dashboard/domain/usecases/get_dashboard_summary_usecase.dart'
    as _i1062;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../../features/inventory/data/datasource/inventory_datasource.dart'
    as _i443;
import '../../features/inventory/data/datasource/inventory_remote_datasource.dart'
    as _i125;
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/domain/repositories/inventory_repository.dart'
    as _i422;
import '../../features/inventory/domain/usecases/adjust_stock_usecase.dart'
    as _i101;
import '../../features/inventory/domain/usecases/get_inventory_usecase.dart'
    as _i122;
import '../../features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i690;
import '../../features/ledger/data/datasource/ledger_datasource.dart' as _i786;
import '../../features/ledger/data/datasource/ledger_remote_datasource.dart'
    as _i140;
import '../../features/ledger/data/repositories/ledger_repository_impl.dart'
    as _i321;
import '../../features/ledger/domain/repositories/ledger_repository.dart'
    as _i11;
import '../../features/ledger/domain/usecases/get_ledger_customers_usecase.dart'
    as _i172;
import '../../features/ledger/domain/usecases/get_ledger_statement_usecase.dart'
    as _i541;
import '../../features/ledger/domain/usecases/record_payment_usecase.dart'
    as _i215;
import '../../features/ledger/presentation/bloc/ledger_bloc.dart' as _i1062;
import '../../features/pos/data/datasource/pos_datasource.dart' as _i343;
import '../../features/pos/data/datasource/pos_remote_datasource.dart' as _i704;
import '../../features/pos/data/repositories/pos_repository_impl.dart' as _i84;
import '../../features/pos/domain/repositories/pos_repository.dart' as _i511;
import '../../features/pos/domain/usecases/check_cart_stock_availability_usecase.dart'
    as _i840;
import '../../features/pos/domain/usecases/confirm_sale_usecase.dart' as _i677;
import '../../features/pos/domain/usecases/pos_get_product_by_barcode_usecase.dart'
    as _i595;
import '../../features/pos/domain/usecases/refund_sale_usecase.dart' as _i316;
import '../../features/pos/presentation/bloc/pos_bloc.dart' as _i853;
import '../../features/products/data/datasource/product_datasource.dart'
    as _i1054;
import '../../features/products/data/datasource/product_remote_datasource.dart'
    as _i541;
import '../../features/products/data/repositories/product_repository_impl.dart'
    as _i764;
import '../../features/products/domain/repositories/product_repository.dart'
    as _i963;
import '../../features/products/domain/usecases/add_product_usecase.dart'
    as _i570;
import '../../features/products/domain/usecases/check_barcode_exists_usecase.dart'
    as _i706;
import '../../features/products/domain/usecases/deactivate_product_usecase.dart'
    as _i132;
import '../../features/products/domain/usecases/delete_product_usecase.dart'
    as _i913;
import '../../features/products/domain/usecases/get_product_by_barcode_usecase.dart'
    as _i59;
import '../../features/products/domain/usecases/get_product_by_id_usecase.dart'
    as _i341;
import '../../features/products/domain/usecases/get_product_sales_count_usecase.dart'
    as _i991;
import '../../features/products/domain/usecases/get_products_by_category_usecase.dart'
    as _i273;
import '../../features/products/domain/usecases/get_products_usecase.dart'
    as _i15;
import '../../features/products/domain/usecases/reassign_products_category_usecase.dart'
    as _i64;
import '../../features/products/domain/usecases/update_product_usecase.dart'
    as _i73;
import '../../features/products/domain/usecases/update_stock_usecase.dart'
    as _i223;
import '../../features/products/presentation/bloc/products_bloc.dart' as _i975;
import '../../features/reports/data/datasource/reports_datasource.dart'
    as _i996;
import '../../features/reports/data/datasource/reports_remote_datasource.dart'
    as _i912;
import '../../features/reports/data/repositories/reports_repository_impl.dart'
    as _i227;
import '../../features/reports/domain/repositories/reports_repository.dart'
    as _i808;
import '../../features/reports/domain/usecases/get_report_usecase.dart' as _i46;
import '../../features/reports/presentation/cubit/reports_cubit.dart' as _i671;
import '../../features/sales_history/data/datasource/sales_history_datasource.dart'
    as _i598;
import '../../features/sales_history/data/datasource/sales_history_remote_datasource.dart'
    as _i417;
import '../../features/sales_history/data/repositories/sales_history_repository_impl.dart'
    as _i874;
import '../../features/sales_history/domain/repositories/sales_history_repository.dart'
    as _i230;
import '../../features/sales_history/domain/usecases/get_sale_by_id_usecase.dart'
    as _i919;
import '../../features/sales_history/domain/usecases/get_sales_usecase.dart'
    as _i634;
import '../../features/sales_history/presentation/bloc/sales_history_bloc.dart'
    as _i416;
import '../../features/settings/data/datasource/receipt_settings_datasource.dart'
    as _i32;
import '../../features/settings/data/datasource/receipt_settings_remote_datasource.dart'
    as _i613;
import '../../features/settings/data/datasource/settings_datasource.dart'
    as _i294;
import '../../features/settings/data/datasource/settings_remote_datasource.dart'
    as _i283;
import '../../features/settings/data/repositories/receipt_settings_repository_impl.dart'
    as _i455;
import '../../features/settings/data/repositories/settings_repository_impl.dart'
    as _i955;
import '../../features/settings/domain/repositories/receipt_settings_repository.dart'
    as _i1047;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/usecases/get_receipt_settings_usecase.dart'
    as _i69;
import '../../features/settings/domain/usecases/get_settings_usecase.dart'
    as _i1029;
import '../../features/settings/domain/usecases/update_receipt_settings_usecase.dart'
    as _i802;
import '../../features/settings/domain/usecases/update_settings_usecase.dart'
    as _i474;
import '../../features/settings/presentation/cubit/locale_cubit.dart' as _i341;
import '../../features/settings/presentation/cubit/receipt_settings_cubit.dart'
    as _i383;
import '../../features/settings/presentation/cubit/settings_cubit.dart'
    as _i792;
import '../../features/shop/data/datasources/shop_datasource.dart' as _i158;
import '../../features/shop/data/datasources/shop_remote_datasource.dart'
    as _i755;
import '../../features/shop/data/repositories/shop_repository_impl.dart'
    as _i704;
import '../../features/shop/domain/repositories/shop_repository.dart' as _i106;
import '../../features/shop/domain/usecases/get_shop_profile_usecase.dart'
    as _i782;
import '../../features/shop/domain/usecases/update_shop_profile_usecase.dart'
    as _i808;
import '../../features/shop/presentation/cubit/shop_profile_cubit.dart'
    as _i570;
import '../local_storage/hive_service.dart' as _i764;
import '../local_storage/shared_prefs_service.dart' as _i270;
import '../network/api_client.dart' as _i557;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/network_info.dart' as _i932;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i764.HiveService>(() => _i764.HiveService());
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i270.SharedPrefsService>(
      () => _i270.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i270.SharedPrefsService>()),
    );
    gh.lazySingleton<_i341.LocaleCubit>(
      () => _i341.LocaleCubit(gh<_i270.SharedPrefsService>()),
    );
    gh.lazySingleton<_i557.ApiClient>(
      () => _i557.ApiClient(gh<_i745.AuthInterceptor>()),
    );
    gh.lazySingleton<_i1054.ProductDataSource>(
      () => _i541.ProductRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i556.DashboardDataSource>(
      () => _i454.DashboardRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i598.SalesHistoryDataSource>(
      () => _i417.SalesHistoryRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i786.LedgerDataSource>(
      () => _i140.LedgerRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i92.CustomerDataSource>(
      () => _i640.CustomerRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i504.CustomerRepository>(
      () => _i877.CustomerRepositoryImpl(gh<_i92.CustomerDataSource>()),
    );
    gh.lazySingleton<_i11.LedgerRepository>(
      () => _i321.LedgerRepositoryImpl(gh<_i786.LedgerDataSource>()),
    );
    gh.factory<_i172.GetLedgerCustomersUseCase>(
      () => _i172.GetLedgerCustomersUseCase(gh<_i11.LedgerRepository>()),
    );
    gh.factory<_i541.GetLedgerStatementUseCase>(
      () => _i541.GetLedgerStatementUseCase(gh<_i11.LedgerRepository>()),
    );
    gh.factory<_i215.RecordPaymentUseCase>(
      () => _i215.RecordPaymentUseCase(gh<_i11.LedgerRepository>()),
    );
    gh.lazySingleton<_i294.SettingsDataSource>(
      () => _i283.SettingsRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i1010.CategoryDataSource>(
      () => _i1028.CategoryRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i32.ReceiptSettingsDataSource>(
      () => _i613.ReceiptSettingsRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i674.SettingsRepository>(
      () => _i955.SettingsRepositoryImpl(gh<_i294.SettingsDataSource>()),
    );
    gh.factory<_i1029.GetSettingsUseCase>(
      () => _i1029.GetSettingsUseCase(gh<_i674.SettingsRepository>()),
    );
    gh.factory<_i474.UpdateSettingsUseCase>(
      () => _i474.UpdateSettingsUseCase(gh<_i674.SettingsRepository>()),
    );
    gh.lazySingleton<_i266.CategoryRepository>(
      () => _i894.CategoryRepositoryImpl(gh<_i1010.CategoryDataSource>()),
    );
    gh.lazySingleton<_i43.AuthDataSource>(
      () => _i175.AuthRemoteDataSource(
        gh<_i557.ApiClient>(),
        gh<_i270.SharedPrefsService>(),
      ),
    );
    gh.lazySingleton<_i158.ShopDataSource>(
      () => _i755.ShopRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i443.InventoryDataSource>(
      () => _i125.InventoryRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.factory<_i863.AddCustomerUseCase>(
      () => _i863.AddCustomerUseCase(gh<_i504.CustomerRepository>()),
    );
    gh.factory<_i270.DeleteCustomerUseCase>(
      () => _i270.DeleteCustomerUseCase(gh<_i504.CustomerRepository>()),
    );
    gh.factory<_i469.GetCustomerByIdUseCase>(
      () => _i469.GetCustomerByIdUseCase(gh<_i504.CustomerRepository>()),
    );
    gh.factory<_i831.GetCustomersUseCase>(
      () => _i831.GetCustomersUseCase(gh<_i504.CustomerRepository>()),
    );
    gh.factory<_i940.UpdateCustomerUseCase>(
      () => _i940.UpdateCustomerUseCase(gh<_i504.CustomerRepository>()),
    );
    gh.lazySingleton<_i996.ReportsDataSource>(
      () => _i912.ReportsRemoteDataSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i43.AuthDataSource>()),
    );
    gh.lazySingleton<_i343.PosDataSource>(
      () => _i704.PosRemoteDataSource(
        gh<_i557.ApiClient>(),
        gh<_i764.HiveService>(),
      ),
    );
    gh.factory<_i1062.LedgerBloc>(
      () => _i1062.LedgerBloc(
        gh<_i172.GetLedgerCustomersUseCase>(),
        gh<_i541.GetLedgerStatementUseCase>(),
        gh<_i215.RecordPaymentUseCase>(),
      ),
    );
    gh.lazySingleton<_i808.ReportsRepository>(
      () => _i227.ReportsRepositoryImpl(gh<_i996.ReportsDataSource>()),
    );
    gh.lazySingleton<_i230.SalesHistoryRepository>(
      () =>
          _i874.SalesHistoryRepositoryImpl(gh<_i598.SalesHistoryDataSource>()),
    );
    gh.lazySingleton<_i106.ShopRepository>(
      () => _i704.ShopRepositoryImpl(gh<_i158.ShopDataSource>()),
    );
    gh.lazySingleton<_i665.DashboardRepository>(
      () => _i509.DashboardRepositoryImpl(gh<_i556.DashboardDataSource>()),
    );
    gh.lazySingleton<_i1047.ReceiptSettingsRepository>(
      () => _i455.ReceiptSettingsRepositoryImpl(
        gh<_i32.ReceiptSettingsDataSource>(),
      ),
    );
    gh.factory<_i782.GetShopProfileUseCase>(
      () => _i782.GetShopProfileUseCase(gh<_i106.ShopRepository>()),
    );
    gh.factory<_i808.UpdateShopProfileUseCase>(
      () => _i808.UpdateShopProfileUseCase(gh<_i106.ShopRepository>()),
    );
    gh.lazySingleton<_i963.ProductRepository>(
      () => _i764.ProductRepositoryImpl(gh<_i1054.ProductDataSource>()),
    );
    gh.factory<_i374.AddCategoryUseCase>(
      () => _i374.AddCategoryUseCase(gh<_i266.CategoryRepository>()),
    );
    gh.factory<_i1007.DeleteCategoryUseCase>(
      () => _i1007.DeleteCategoryUseCase(gh<_i266.CategoryRepository>()),
    );
    gh.factory<_i76.GetCategoriesUseCase>(
      () => _i76.GetCategoriesUseCase(gh<_i266.CategoryRepository>()),
    );
    gh.factory<_i656.UpdateCategoryUseCase>(
      () => _i656.UpdateCategoryUseCase(gh<_i266.CategoryRepository>()),
    );
    gh.factory<_i570.AddProductUseCase>(
      () => _i570.AddProductUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i706.CheckBarcodeExistsUseCase>(
      () => _i706.CheckBarcodeExistsUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i132.DeactivateProductUseCase>(
      () => _i132.DeactivateProductUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i913.DeleteProductUseCase>(
      () => _i913.DeleteProductUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i59.GetProductByBarcodeUseCase>(
      () => _i59.GetProductByBarcodeUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i341.GetProductByIdUseCase>(
      () => _i341.GetProductByIdUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i273.GetProductsByCategoryUseCase>(
      () => _i273.GetProductsByCategoryUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i15.GetProductsUseCase>(
      () => _i15.GetProductsUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i64.ReassignProductsCategoryUseCase>(
      () => _i64.ReassignProductsCategoryUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i73.UpdateProductUseCase>(
      () => _i73.UpdateProductUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i223.UpdateStockUseCase>(
      () => _i223.UpdateStockUseCase(gh<_i963.ProductRepository>()),
    );
    gh.factory<_i560.ForgotPasswordUseCase>(
      () => _i560.ForgotPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i474.ResetPasswordUseCase>(
      () => _i474.ResetPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i503.VerifyOtpUseCase>(
      () => _i503.VerifyOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i792.SettingsCubit>(
      () => _i792.SettingsCubit(
        gh<_i1029.GetSettingsUseCase>(),
        gh<_i474.UpdateSettingsUseCase>(),
      ),
    );
    gh.lazySingleton<_i422.InventoryRepository>(
      () => _i572.InventoryRepositoryImpl(gh<_i443.InventoryDataSource>()),
    );
    gh.factory<_i46.GetReportUseCase>(
      () => _i46.GetReportUseCase(gh<_i808.ReportsRepository>()),
    );
    gh.factory<_i919.GetSaleByIdUseCase>(
      () => _i919.GetSaleByIdUseCase(gh<_i230.SalesHistoryRepository>()),
    );
    gh.factory<_i634.GetSalesUseCase>(
      () => _i634.GetSalesUseCase(gh<_i230.SalesHistoryRepository>()),
    );
    gh.factory<_i1062.GetDashboardSummaryUseCase>(
      () => _i1062.GetDashboardSummaryUseCase(gh<_i665.DashboardRepository>()),
    );
    gh.factory<_i19.CustomersBloc>(
      () => _i19.CustomersBloc(
        gh<_i831.GetCustomersUseCase>(),
        gh<_i469.GetCustomerByIdUseCase>(),
        gh<_i863.AddCustomerUseCase>(),
        gh<_i940.UpdateCustomerUseCase>(),
        gh<_i270.DeleteCustomerUseCase>(),
      ),
    );
    gh.factory<_i991.GetProductSalesCountUseCase>(
      () =>
          _i991.GetProductSalesCountUseCase(gh<_i230.SalesHistoryRepository>()),
    );
    gh.factory<_i69.GetReceiptSettingsUseCase>(
      () => _i69.GetReceiptSettingsUseCase(
        gh<_i1047.ReceiptSettingsRepository>(),
      ),
    );
    gh.factory<_i802.UpdateReceiptSettingsUseCase>(
      () => _i802.UpdateReceiptSettingsUseCase(
        gh<_i1047.ReceiptSettingsRepository>(),
      ),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(gh<_i1062.GetDashboardSummaryUseCase>()),
    );
    gh.lazySingleton<_i511.PosRepository>(
      () => _i84.PosRepositoryImpl(
        gh<_i343.PosDataSource>(),
        gh<_i963.ProductRepository>(),
      ),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(
        gh<_i787.AuthRepository>(),
        gh<_i106.ShopRepository>(),
      ),
    );
    gh.factory<_i570.ShopProfileCubit>(
      () => _i570.ShopProfileCubit(
        gh<_i782.GetShopProfileUseCase>(),
        gh<_i808.UpdateShopProfileUseCase>(),
      ),
    );
    gh.factory<_i840.CheckCartStockAvailabilityUseCase>(
      () => _i840.CheckCartStockAvailabilityUseCase(
        gh<_i963.ProductRepository>(),
      ),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i941.RegisterUseCase>(),
        gh<_i503.VerifyOtpUseCase>(),
        gh<_i560.ForgotPasswordUseCase>(),
        gh<_i474.ResetPasswordUseCase>(),
        gh<_i48.LogoutUseCase>(),
        gh<_i270.SharedPrefsService>(),
      ),
    );
    gh.factory<_i671.ReportsCubit>(
      () => _i671.ReportsCubit(gh<_i46.GetReportUseCase>()),
    );
    gh.factory<_i101.AdjustStockUseCase>(
      () => _i101.AdjustStockUseCase(gh<_i422.InventoryRepository>()),
    );
    gh.factory<_i122.GetInventoryUseCase>(
      () => _i122.GetInventoryUseCase(gh<_i422.InventoryRepository>()),
    );
    gh.factory<_i802.CategoriesCubit>(
      () => _i802.CategoriesCubit(
        gh<_i76.GetCategoriesUseCase>(),
        gh<_i374.AddCategoryUseCase>(),
        gh<_i656.UpdateCategoryUseCase>(),
        gh<_i1007.DeleteCategoryUseCase>(),
        gh<_i273.GetProductsByCategoryUseCase>(),
        gh<_i64.ReassignProductsCategoryUseCase>(),
      ),
    );
    gh.factory<_i416.SalesHistoryBloc>(
      () => _i416.SalesHistoryBloc(
        gh<_i634.GetSalesUseCase>(),
        gh<_i919.GetSaleByIdUseCase>(),
      ),
    );
    gh.factory<_i975.ProductsBloc>(
      () => _i975.ProductsBloc(
        gh<_i15.GetProductsUseCase>(),
        gh<_i341.GetProductByIdUseCase>(),
        gh<_i570.AddProductUseCase>(),
        gh<_i73.UpdateProductUseCase>(),
        gh<_i913.DeleteProductUseCase>(),
        gh<_i132.DeactivateProductUseCase>(),
        gh<_i706.CheckBarcodeExistsUseCase>(),
        gh<_i991.GetProductSalesCountUseCase>(),
      ),
    );
    gh.factory<_i595.PosGetProductByBarcodeUseCase>(
      () => _i595.PosGetProductByBarcodeUseCase(gh<_i511.PosRepository>()),
    );
    gh.factory<_i383.ReceiptSettingsCubit>(
      () => _i383.ReceiptSettingsCubit(
        gh<_i69.GetReceiptSettingsUseCase>(),
        gh<_i802.UpdateReceiptSettingsUseCase>(),
      ),
    );
    gh.factory<_i690.InventoryBloc>(
      () => _i690.InventoryBloc(
        gh<_i122.GetInventoryUseCase>(),
        gh<_i101.AdjustStockUseCase>(),
      ),
    );
    gh.factory<_i677.ConfirmSaleUseCase>(
      () => _i677.ConfirmSaleUseCase(gh<_i511.PosRepository>()),
    );
    gh.factory<_i316.RefundSaleUseCase>(
      () => _i316.RefundSaleUseCase(gh<_i511.PosRepository>()),
    );
    gh.factory<_i853.PosBloc>(
      () => _i853.PosBloc(
        gh<_i677.ConfirmSaleUseCase>(),
        gh<_i840.CheckCartStockAvailabilityUseCase>(),
        gh<_i595.PosGetProductByBarcodeUseCase>(),
        gh<_i341.GetProductByIdUseCase>(),
        gh<_i511.PosRepository>(),
      ),
    );
    return this;
  }
}
