// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'ShopFlow';

  @override
  String get appTagline => 'Smart POS for your shop';

  @override
  String get btnContinue => 'Continue';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get btnConfirm => 'Confirm';

  @override
  String get btnSave => 'Save';

  @override
  String get btnDelete => 'Delete';

  @override
  String get btnEdit => 'Edit';

  @override
  String get btnRetry => 'Retry';

  @override
  String get btnBack => 'Back';

  @override
  String get btnNext => 'Next';

  @override
  String get btnDone => 'Done';

  @override
  String get btnAdd => 'Add';

  @override
  String get btnSearch => 'Search';

  @override
  String get btnSubmit => 'Submit';

  @override
  String get btnClose => 'Close';

  @override
  String get btnYes => 'Yes';

  @override
  String get btnNo => 'No';

  @override
  String get btnLogout => 'Logout';

  @override
  String get labelLoading => 'Loading…';

  @override
  String get labelRequired => 'Required';

  @override
  String get labelOptional => 'Optional';

  @override
  String get validationFullNameRequired => 'Please enter your full name';

  @override
  String get validationFullNameMinLength =>
      'Full name must be at least 2 characters';

  @override
  String get validationShopNameRequired => 'Please enter your shop name';

  @override
  String get validationShopNameMinLength =>
      'Shop name must be at least 2 characters';

  @override
  String get validationPhoneRequired => 'Please enter a phone number';

  @override
  String get validationPhoneDigitsOnly =>
      'Phone number can only contain digits';

  @override
  String get validationPhoneInvalidPrefix =>
      'Number must start with 03, +92, or 923';

  @override
  String get validationPhoneInvalidMobile =>
      'Enter a valid mobile number starting with 3';

  @override
  String get validationPhoneTooShort => 'Phone number is too short';

  @override
  String get validationPhoneTooLong => 'Phone number is too long';

  @override
  String get validationPhoneInvalid => 'Enter a valid Pakistani phone number';

  @override
  String get validationEmailInvalid => 'Please enter a valid email address';

  @override
  String get validationPasswordRequired => 'Please enter a password';

  @override
  String get validationPasswordMinLength =>
      'Password must be at least 6 characters';

  @override
  String get validationConfirmPasswordRequired =>
      'Please confirm your password';

  @override
  String get validationPasswordMismatch => 'Passwords do not match';

  @override
  String get validationOwnerNameRequired => 'Please enter owner name';

  @override
  String get validationOwnerNameMinLength =>
      'Owner name must be at least 2 characters';

  @override
  String get validationLoginIdentifierRequired =>
      'Please enter your email or phone number';

  @override
  String get validationCustomerNameRequired => 'Please enter customer name';

  @override
  String get validationCustomerNameMinLength =>
      'Customer name must be at least 2 characters';

  @override
  String get validationCategoryNameRequired => 'Please enter a category name';

  @override
  String get validationCategoryNameMinLength =>
      'Category name must be at least 2 characters';

  @override
  String get validationProductNameRequired => 'Please enter a product name';

  @override
  String get validationProductNameMinLength =>
      'Product name must be at least 2 characters';

  @override
  String get validationProductPriceRequired => 'Please enter selling price';

  @override
  String get validationProductPriceInvalid => 'Enter a valid selling price';

  @override
  String get validationProductCostRequired => 'Please enter purchase price';

  @override
  String get validationProductCostInvalid => 'Enter a valid purchase price';

  @override
  String get validationProductBarcodeRequired => 'Please enter a barcode';

  @override
  String get validationProductBarcodeInvalid =>
      'Barcode must be at least 3 characters';

  @override
  String get validationProductStockRequired => 'Please enter stock quantity';

  @override
  String get validationProductStockInvalid => 'Enter a valid stock quantity';

  @override
  String get validationProductCategoryRequired => 'Please select a category';

  @override
  String get validationInventoryStockRequired =>
      'Please enter new stock quantity';

  @override
  String get validationInventoryReasonRequired =>
      'Please enter a reason for adjustment';

  @override
  String get msgSomethingWentWrong => 'Something went wrong. Please try again.';

  @override
  String get msgNoInternet => 'No internet connection';

  @override
  String get msgSuccess => 'Success';

  @override
  String get confirmDeleteTitle => 'Confirm Delete';

  @override
  String get confirmDeleteMessage =>
      'Are you sure you want to delete this? This action cannot be undone.';

  @override
  String get searchHint => 'Search…';

  @override
  String get splashTitle => 'ShopFlow';

  @override
  String get onboardingTitle1 => 'Sell Faster';

  @override
  String get onboardingDesc1 =>
      'Checkout in seconds with barcode scanning and quick cart.';

  @override
  String get onboardingTitle2 => 'Track Everything';

  @override
  String get onboardingDesc2 =>
      'Manage products, stock, customers, and ledger in one place.';

  @override
  String get onboardingTitle3 => 'Grow Your Shop';

  @override
  String get onboardingDesc3 =>
      'Get insights with sales reports and inventory alerts.';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get loginTitle => 'Welcome back';

  @override
  String get loginSubtitle => 'Sign in to continue to ShopFlow';

  @override
  String get loginEmailLabel => 'Email or Phone';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginButton => 'Sign In';

  @override
  String get loginForgotPassword => 'Forgot password?';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginRegisterLink => 'Register';

  @override
  String get registerTitle => 'Set up your shop';

  @override
  String get registerSubtitle =>
      'Join ShopFlow to manage your inventory, sales, and orders seamlessly.';

  @override
  String get registerNameLabel => 'Owner Name';

  @override
  String get registerOwnerNameLabel => 'Owner Name';

  @override
  String get registerShopNameLabel => 'Shop Name';

  @override
  String get registerPhoneLabel => 'Phone Number';

  @override
  String get registerEmailLabel => 'Email';

  @override
  String get registerPasswordLabel => 'Password';

  @override
  String get registerConfirmPasswordLabel => 'Confirm Password';

  @override
  String get registerAddressOptionalLabel => 'Address (Optional)';

  @override
  String get registerAddLogo => 'Add Logo';

  @override
  String get registerButton => 'Create Account';

  @override
  String get registerHaveAccount => 'Already have an account?';

  @override
  String get registerLoginLink => 'Log in';

  @override
  String get otpTitle => 'Verify OTP';

  @override
  String get otpVerifyPhoneTitle => 'Verify Phone';

  @override
  String get otpSubtitle => 'Enter the 6-digit code sent to your phone';

  @override
  String otpSentTo(String phone) {
    return 'Enter the 6-digit code sent to $phone';
  }

  @override
  String get otpResend => 'Resend code';

  @override
  String get otpResendPrompt => 'Didn\'t receive code?';

  @override
  String get otpResendNow => 'Resend Now';

  @override
  String get otpVerifyButton => 'Verify';

  @override
  String otpDevCode(String otp) {
    return 'Development OTP: $otp';
  }

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your registered phone number to receive an OTP.';

  @override
  String get forgotPasswordButton => 'Send OTP';

  @override
  String get forgotPasswordSuccess => 'OTP sent successfully';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordSubtitle =>
      'Create a new secure password for your account.';

  @override
  String get resetPasswordNewLabel => 'New Password';

  @override
  String get resetPasswordNewHint => 'Enter new password';

  @override
  String get resetPasswordConfirmLabel => 'Confirm New Password';

  @override
  String get resetPasswordConfirmHint => 'Re-enter new password';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get resetPasswordSuccess => 'Password reset successfully';

  @override
  String get resetPasswordRequirementLength => 'Minimum 8 characters';

  @override
  String get resetPasswordRequirementNumber => 'At least one number';

  @override
  String get resetPasswordRequirementSpecial =>
      'At least one special character';

  @override
  String get validationResetPasswordRequired => 'Please enter a new password';

  @override
  String get validationResetPasswordInvalid =>
      'Password does not meet the requirements';

  @override
  String get validationResetPasswordConfirmRequired =>
      'Please confirm your new password';

  @override
  String get authLoginSuccess => 'Signed in successfully';

  @override
  String get authRegisterSuccess => 'Account created successfully';

  @override
  String get authLogoutConfirmTitle => 'Logout';

  @override
  String get authLogoutConfirmMessage => 'Are you sure you want to logout?';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardTodaySales => 'Today\'s Sales';

  @override
  String get dashboardTodayOrders => 'Orders';

  @override
  String get dashboardLowStock => 'Low Stock';

  @override
  String get dashboardPendingLedger => 'Pending Ledger';

  @override
  String get dashboardQuickActions => 'Quick Actions';

  @override
  String get dashboardNewSale => 'New Sale';

  @override
  String get dashboardAddProduct => 'Add Product';

  @override
  String get dashboardAddCustomer => 'Add Customer';

  @override
  String get dashboardViewReports => 'Reports';

  @override
  String get dashboardEmptyMessage =>
      'No activity yet. Start a sale to see your dashboard fill up.';

  @override
  String get dashboardGoodMorning => 'Good morning';

  @override
  String get dashboardGoodAfternoon => 'Good afternoon';

  @override
  String get dashboardGoodEvening => 'Good evening';

  @override
  String get dashboardSubtitle => 'Here\'s what\'s happening today.';

  @override
  String get dashboardSearchHint => 'Search products, orders…';

  @override
  String dashboardSalesGrowth(double percent) {
    return '↑ $percent% vs yesterday';
  }

  @override
  String dashboardPendingAccounts(int count) {
    return '$count accounts to collect today';
  }

  @override
  String get dashboardRequiresRestock => 'Requires immediate restock';

  @override
  String get dashboardLedger => 'Ledger';

  @override
  String get dashboardOutstanding => 'Outstanding';

  @override
  String get dashboardAlerts => 'Alerts';

  @override
  String get dashboardLowInStock => 'Low in stock';

  @override
  String get dashboardTopSelling => 'Top Selling';

  @override
  String get dashboardTopSellingProducts => 'Top Selling Products';

  @override
  String get dashboardRecentTransactions => 'Recent Transactions';

  @override
  String get dashboardViewAll => 'View All';

  @override
  String get dashboardNavSales => 'Sales';

  @override
  String get dashboardNavMore => 'More';

  @override
  String get moreMenuPosSubtitle => 'Open checkout and start a new sale';

  @override
  String get moreMenuCustomersSubtitle =>
      'Manage customer profiles and ledger accounts';

  @override
  String get moreMenuLedgerSubtitle =>
      'View khata balances and record payments';

  @override
  String get moreMenuProductsSubtitle =>
      'Browse and manage your product catalog';

  @override
  String get moreMenuCategoriesSubtitle => 'Organize products into categories';

  @override
  String get moreMenuReports => 'Reports & Analytics';

  @override
  String get moreMenuReportsSubtitle => 'Sales summaries and business insights';

  @override
  String get moreMenuSettingsSubtitle =>
      'Shop profile, preferences, and app settings';

  @override
  String get moreSettingsTitle => 'Settings';

  @override
  String get moreMenuShopProfile => 'Shop Profile';

  @override
  String get moreMenuReceiptSettings => 'Receipt Settings';

  @override
  String get moreMenuPrinter => 'Printer';

  @override
  String get morePrinterComingSoon => 'Printer setup is coming soon.';

  @override
  String get moreLanguageEnglish => 'English';

  @override
  String get moreLanguageUrdu => 'Urdu';

  @override
  String get moreLanguageSaved => 'Language preference saved.';

  @override
  String get moreAboutDescription =>
      'ShopFlow POS for grocery and kiryana shops. Version 1.0.0';

  @override
  String get shopProfileSaveChanges => 'Save Changes';

  @override
  String get shopProfileAddressLabel => 'Shop Address';

  @override
  String get shopProfileTaxNumberLabel => 'Tax / NTN Number';

  @override
  String get shopLogoGallery => 'Choose from Gallery';

  @override
  String get shopLogoCamera => 'Take Photo';

  @override
  String get shopLogoRemove => 'Remove Logo';

  @override
  String get imagePickerRemove => 'Remove Photo';

  @override
  String get languagePageSubtitle =>
      'Choose the language for the entire app. Receipts and screens update automatically.';

  @override
  String get receiptSettingsDisplaySection => 'Display Options';

  @override
  String get receiptSettingsNotesSection => 'Notes & Numbering';

  @override
  String get receiptShowLogo => 'Show shop logo';

  @override
  String get receiptShowAddress => 'Show address';

  @override
  String get receiptShowPhone => 'Show phone number';

  @override
  String get receiptShowTaxNumber => 'Show tax / NTN number';

  @override
  String get receiptShowCustomerName => 'Show customer name';

  @override
  String get receiptShowLedgerBalance => 'Show ledger balance';

  @override
  String get receiptShowPaymentMethod => 'Show payment method';

  @override
  String get receiptShowCashierName => 'Show cashier name';

  @override
  String get receiptHeaderNoteLabel => 'Header note';

  @override
  String get receiptNumberPrefixLabel => 'Receipt number prefix';

  @override
  String get receiptPreviewTitle => 'Receipt Preview';

  @override
  String get receiptPreviewButton => 'Preview Receipt';

  @override
  String get receiptDownloadButton => 'Download';

  @override
  String get receiptShareButton => 'Share';

  @override
  String get dashboardOpenLedger => 'Open Ledger';

  @override
  String get dashboardScanItem => 'Scan Item';

  @override
  String get dashboardPrintLastBill => 'Print Last Bill';

  @override
  String get dashboardStatusPaid => 'Paid';

  @override
  String get dashboardStatusLedger => 'Ledger';

  @override
  String dashboardItemsCount(int count) {
    return '$count items';
  }

  @override
  String dashboardUnitsSold(int count) {
    return '$count units sold';
  }

  @override
  String get dashboardColCustomer => 'Customer';

  @override
  String get dashboardColTime => 'Time';

  @override
  String get dashboardColItems => 'Items';

  @override
  String get dashboardColStatus => 'Status';

  @override
  String get dashboardColAmount => 'Amount';

  @override
  String get posTitle => 'Checkout';

  @override
  String get posCartEmpty => 'Cart is empty';

  @override
  String get posCartEmptyHint => 'Scan or search products to add them';

  @override
  String get posTabProducts => 'Products';

  @override
  String get posTabCart => 'Cart';

  @override
  String get posScanBarcode => 'Scan Barcode';

  @override
  String get posSearchProduct => 'Search products…';

  @override
  String get posSaleTypeCash => 'Cash Sale';

  @override
  String get posSaleTypeLedger => 'Ledger Sale';

  @override
  String get posSelectCustomer => 'Select Customer';

  @override
  String get posChangeCustomer => 'Change';

  @override
  String get posPartialPayment => 'Partial Payment';

  @override
  String get posCashReceived => 'Cash Received';

  @override
  String get posCashRequiredTitle => 'Cash amount required';

  @override
  String get posCashRequiredMessage =>
      'Enter the cash received from the customer before confirming this sale.';

  @override
  String get posInsufficientCashTitle => 'Insufficient cash received';

  @override
  String get posInsufficientCashMessage =>
      'Cash received is less than the sale total. Switch to a Ledger Sale to record the remaining balance, or collect the full amount.';

  @override
  String get posInsufficientCash => 'Cash received is less than total';

  @override
  String get posShareWhatsApp => 'Share on WhatsApp';

  @override
  String get posViewReceipt => 'View Receipt';

  @override
  String get posSharePhoneTitle => 'Customer phone number';

  @override
  String get posSharePhoneMessage =>
      'Enter the WhatsApp number to send this receipt to.';

  @override
  String get posSwitchToLedgerSale => 'Switch to Ledger Sale';

  @override
  String get posCustomerRequiredTitle => 'Customer required';

  @override
  String get posChangeDue => 'Change Due';

  @override
  String get posSubtotal => 'Subtotal';

  @override
  String get posTotal => 'Total';

  @override
  String get posQuantity => 'Qty';

  @override
  String get posQuantityByWeight => 'By Weight';

  @override
  String get posQuantityByAmount => 'By Amount';

  @override
  String posQuantityLabel(String unit) {
    return 'Quantity ($unit)';
  }

  @override
  String get posAmountLabel => 'Amount (Rs.)';

  @override
  String get posAddToCart => 'Add to Cart';

  @override
  String get posAddedToCart => 'Added to cart';

  @override
  String get posLedgerLocked => 'Ledger sale unavailable for cash customers';

  @override
  String get posLedgerRemainder => 'Added to ledger';

  @override
  String get posOutstandingBalance => 'Outstanding balance';

  @override
  String get posOutOfStock => 'Product is out of stock';

  @override
  String get posStockCapped => 'Quantity capped to available stock';

  @override
  String get posCartDiscount => 'Cart discount';

  @override
  String get posItemDiscount => 'Item discount';

  @override
  String get posTax => 'Tax';

  @override
  String get posConfirmSale => 'Confirm Sale';

  @override
  String get posSaleSuccess => 'Sale completed successfully';

  @override
  String get posResumeDraftTitle => 'Resume previous sale?';

  @override
  String get posResumeDraftMessage =>
      'You have an unfinished sale from your last session. Would you like to continue where you left off?';

  @override
  String get posResumeDraftConfirm => 'Resume';

  @override
  String get posResumeDraftDiscard => 'Discard';

  @override
  String get posClearCart => 'Clear Cart';

  @override
  String get posClearCartTitle => 'Clear cart?';

  @override
  String get posClearCartMessage =>
      'This will remove all items and reset the current sale.';

  @override
  String get posClearCartConfirm => 'Clear Cart';

  @override
  String get posRemoveItemTitle => 'Remove Item';

  @override
  String get posRemoveItemMessage => 'Remove this item from the cart?';

  @override
  String get posCustomerRequired => 'Please select a customer for ledger sale';

  @override
  String get barcodeScannerTitle => 'Scan Barcode';

  @override
  String get barcodeScannerHint => 'Point camera at product barcode';

  @override
  String get barcodeNotFound => 'Product not found for this barcode';

  @override
  String get productsTitle => 'Products';

  @override
  String get productsSubtitle => 'Browse and manage your product catalog.';

  @override
  String get productsSearchHint => 'Search products…';

  @override
  String get filterAll => 'All';

  @override
  String get loadMoreProducts => 'Load More Products';

  @override
  String productInStockCount(int count) {
    return '$count in stock';
  }

  @override
  String productLowStockCount(int count) {
    return 'Low Stock ($count)';
  }

  @override
  String productSkuLabel(String sku) {
    return 'SKU: $sku';
  }

  @override
  String get productActive => 'Active';

  @override
  String get productRetailPrice => 'Retail Price';

  @override
  String productCostValue(String amount) {
    return 'Cost: $amount';
  }

  @override
  String get productUnits => 'Units';

  @override
  String productReorderLevel(int count, String unit) {
    return 'Reorder level: $count $unit';
  }

  @override
  String get productSupplierDetails => 'Supplier Details';

  @override
  String get productSupplierName => 'Supplier Name';

  @override
  String get productContact => 'Contact';

  @override
  String get productLeadTime => 'Lead Time';

  @override
  String get productLastOrdered => 'Last Ordered';

  @override
  String get productStockHistory => 'Stock History';

  @override
  String get productViewFullHistory => 'View Full History';

  @override
  String get productsEmpty => 'No products yet';

  @override
  String get productsEmptyHint => 'Add your first product to get started';

  @override
  String get inventoryEmptyTitle => 'Your inventory is empty';

  @override
  String get inventoryEmptySubtitle =>
      'Start adding products to see them listed here and manage your stock.';

  @override
  String get inventoryEmptyAction => 'Add your first product';

  @override
  String get productsSearchEmptyTitle => 'No products found';

  @override
  String get productsSearchEmptySubtitle =>
      'Try a different search term or clear filters to see all products.';

  @override
  String get inventoryLowStockEmptyTitle =>
      'Nothing running low — you\'re all stocked up!';

  @override
  String get inventoryLowStockEmptySubtitle =>
      'All products are above their low-stock threshold.';

  @override
  String get inventoryOutOfStockEmptyTitle => 'Nothing out of stock right now.';

  @override
  String get inventoryOutOfStockEmptySubtitle =>
      'Every product in your catalog currently has available stock.';

  @override
  String get inventoryFilterAll => 'All';

  @override
  String get inventoryFilterLowStock => 'Low Stock';

  @override
  String get inventoryFilterOutOfStock => 'Out of Stock';

  @override
  String get productsAdd => 'Add Product';

  @override
  String get productsAddNew => 'Add New Product';

  @override
  String get productsEdit => 'Edit Product';

  @override
  String get productsDetails => 'Product Details';

  @override
  String get productNameLabel => 'Product Name';

  @override
  String get productNameHint => 'e.g. Premium Rice 5kg';

  @override
  String get productBarcodeLabel => 'Barcode';

  @override
  String get productBarcodeHint => 'Scan or enter code';

  @override
  String get productGenerateQr => 'Generate QR';

  @override
  String get productCategoryLabel => 'Category';

  @override
  String get productSelectCategory => 'Select Category';

  @override
  String get productPriceLabel => 'Selling Price';

  @override
  String get productPurchasePriceLabel => 'Purchase Price';

  @override
  String get productCostLabel => 'Cost Price';

  @override
  String get productStockLabel => 'Stock Qty';

  @override
  String get productStockQuantityLabel => 'Stock Quantity';

  @override
  String get productLowStockLabel => 'Low Stock Alert';

  @override
  String get productUnitLabel => 'Unit';

  @override
  String get productUnitPcs => 'Pcs (Pieces)';

  @override
  String get productUnitBag => 'Bag';

  @override
  String get productUnitPack => 'Pack';

  @override
  String get productUnitBottle => 'Bottle';

  @override
  String get productUnitKg => 'Kg';

  @override
  String get productUnitLiter => 'Liter';

  @override
  String get productDescriptionOptionalLabel => 'Description (Optional)';

  @override
  String get productDescriptionHint => 'Add details about the product…';

  @override
  String get productPhotoHint => 'Tap to add photo';

  @override
  String get productSaveButton => 'Save Product';

  @override
  String get productUpdateButton => 'Update Product';

  @override
  String get productSaveAndAddAnother => 'Save & Add Another';

  @override
  String get productSaveSuccess => 'Product saved successfully';

  @override
  String get productDeleteSuccess => 'Product deleted successfully';

  @override
  String get productDeactivate => 'Deactivate';

  @override
  String get productDeactivateTitle => 'Deactivate product?';

  @override
  String get productDeactivateMessage =>
      'This product will be hidden from POS and new sales, but past invoices will remain intact.';

  @override
  String get productDeactivateSuccess => 'Product deactivated successfully';

  @override
  String get productDeleteBlockedTitle => 'Cannot delete product';

  @override
  String get productDeleteBlockedMessage =>
      'This product has sales history. Deactivate it instead to hide it from POS while keeping records.';

  @override
  String get productInactive => 'Inactive';

  @override
  String get productBarcodeExists =>
      'This barcode is already used by another product';

  @override
  String get productPriceBelowCostWarning =>
      'Selling price is below purchase price';

  @override
  String get productDeleteConfirm =>
      'Are you sure you want to delete this product?';

  @override
  String get categoriesTitle => 'Categories';

  @override
  String get categoriesSubtitle => 'Manage your store\'s inventory sections.';

  @override
  String get categoriesEmpty => 'No categories yet';

  @override
  String get categoriesEmptyHint => 'Create a category to organize products';

  @override
  String get categoriesEmptyTitle => 'No categories yet';

  @override
  String get categoriesEmptySubtitle =>
      'Create categories to organize your products and speed up checkout.';

  @override
  String get categoriesAdd => 'Add Category';

  @override
  String get categoryEditTitle => 'Edit Category';

  @override
  String get categoryNameLabel => 'Category Name';

  @override
  String get categoryNameHint => 'e.g. Dairy Products';

  @override
  String get categorySelectIcon => 'Select Icon';

  @override
  String get categorySaveButton => 'Save Category';

  @override
  String get categorySaveSuccess => 'Category saved successfully';

  @override
  String get categoryDeleteSuccess => 'Category deleted successfully';

  @override
  String get categoryDeleteBlockedTitle => 'Category has products';

  @override
  String categoryDeleteBlockedMessage(String categoryName, int count) {
    return '$categoryName has $count product(s). Reassign them to another category before deleting.';
  }

  @override
  String categoryDeleteNoTargetMessage(String categoryName) {
    return '$categoryName is the only category. Create another category before deleting this one.';
  }

  @override
  String get categoryReassignTargetLabel => 'Move products to';

  @override
  String get categoryReassignAndDelete => 'Reassign & Delete';

  @override
  String get categoryDeleteConfirm => 'Delete this category?';

  @override
  String get customersTitle => 'Customers';

  @override
  String get customersSubtitle =>
      'Manage your customer relationships and ledgers.';

  @override
  String get customersSearchHint => 'Search by name or phone…';

  @override
  String get customersEmpty => 'No customers yet';

  @override
  String get customersEmptyHint => 'Add a customer to start ledger sales';

  @override
  String get customersEmptyTitle => 'No customers added';

  @override
  String get customersEmptySubtitle =>
      'Keep track of your regulars by adding them to your customer list.';

  @override
  String get customersAdd => 'Add Customer';

  @override
  String get customersDetails => 'Customer Details';

  @override
  String get customerEditTitle => 'Edit Customer';

  @override
  String get customerAddSubtitle => 'Enter the details for your new customer.';

  @override
  String get customerNameLabel => 'Customer Name';

  @override
  String get customerPhoneLabel => 'Phone Number';

  @override
  String get customerAddressLabel => 'Address';

  @override
  String get customerNotesLabel => 'Notes';

  @override
  String get customerNotesOptionalLabel => 'Notes (Optional)';

  @override
  String get customerBalanceLabel => 'Balance';

  @override
  String get customerPendingLedger => 'Pending Ledger';

  @override
  String get customerTotalLedgerBalance => 'Total Ledger Balance';

  @override
  String get customerPendingSettlement => 'Pending Settlement';

  @override
  String get customerTabHistory => 'History';

  @override
  String get customerTabPayments => 'Payments';

  @override
  String get customerTabNotes => 'Notes';

  @override
  String get customerStatusClear => 'Clear';

  @override
  String get customerStatusUnpaid => 'Unpaid';

  @override
  String get customerStatusSettled => 'Settled';

  @override
  String get customerLedgerSale => 'Ledger Sale';

  @override
  String get customerPaymentReceived => 'Payment Received';

  @override
  String get customerNoPayments => 'No payments recorded yet';

  @override
  String get customerNoNotes => 'No notes for this customer';

  @override
  String get customerSaveButton => 'Save Customer';

  @override
  String get customerSaveSuccess => 'Customer saved successfully';

  @override
  String get customerDeleteSuccess => 'Customer deleted successfully';

  @override
  String get customerDeleteConfirm => 'Delete this customer?';

  @override
  String get ledgerTitle => 'Ledger';

  @override
  String get ledgerSearchHint => 'Search by name or phone…';

  @override
  String get ledgerSearchEmptyTitle => 'No ledger customers found';

  @override
  String get ledgerSearchEmptySubtitle =>
      'Try a different name or phone number.';

  @override
  String get ledgerEmpty => 'No ledger customers';

  @override
  String get ledgerEmptyHint => 'Ledger customers appear after ledger sales';

  @override
  String get ledgerClearTitle => 'All ledgers are clear';

  @override
  String get ledgerClearSubtitle =>
      'There are no outstanding balances or recent transactions to display.';

  @override
  String get ledgerClearAction => 'View Reports';

  @override
  String get ledgerStatementEmptyTitle => 'No transactions yet';

  @override
  String get ledgerStatementEmptySubtitle =>
      'Transactions will appear here once sales or payments are recorded.';

  @override
  String get ledgerStatement => 'Statement';

  @override
  String get ledgerRecordPayment => 'Record Payment';

  @override
  String get ledgerRecordPaymentHint =>
      'Enter the payment amount to reduce the customer\'s ledger balance.';

  @override
  String ledgerOutstandingAmount(String amount) {
    return 'Outstanding: $amount';
  }

  @override
  String get ledgerAmountReceived => 'Amount Received';

  @override
  String get ledgerFullPayment => 'Full Payment';

  @override
  String get ledgerPartialPayment => 'Partial Payment';

  @override
  String get ledgerPaymentMethodCash => 'Cash';

  @override
  String get ledgerNotesOptionalLabel => 'Notes (Optional)';

  @override
  String get ledgerConfirmPayment => 'Confirm Payment';

  @override
  String get ledgerTotalBalance => 'Total Balance';

  @override
  String get ledgerDue => 'Due';

  @override
  String ledgerKhataTag(String number) {
    return 'Khata: #$number';
  }

  @override
  String get ledgerRegularCustomer => 'Regular Customer';

  @override
  String get ledgerOpeningBalance => 'Opening Balance';

  @override
  String get ledgerEntrySale => 'Sale';

  @override
  String get ledgerEntryPayment => 'Payment';

  @override
  String ledgerBillReference(String billId) {
    return 'Bill $billId';
  }

  @override
  String ledgerRunningBalance(String amount) {
    return '$amount Dr';
  }

  @override
  String get ledgerStatementEnd => 'End of statement for selected period';

  @override
  String get ledgerShareStatement => 'Share Statement';

  @override
  String get ledgerAmountLabel => 'Amount';

  @override
  String get ledgerPaymentMethodLabel => 'Payment Method';

  @override
  String get ledgerNotesLabel => 'Notes';

  @override
  String get ledgerPaymentSuccess => 'Payment recorded successfully';

  @override
  String get ledgerOutstanding => 'Outstanding';

  @override
  String get ledgerTotalDebit => 'Total Debit';

  @override
  String get ledgerTotalCredit => 'Total Credit';

  @override
  String get ledgerBalance => 'Balance';

  @override
  String get ledgerNoEntries => 'No transactions yet';

  @override
  String get salesHistoryTitle => 'Sales History';

  @override
  String get salesHistorySubtitle =>
      'Browse and filter cash and ledger transactions';

  @override
  String salesHistorySalesCount(int count) {
    return '$count sales';
  }

  @override
  String get salesHistoryTotalLabel => 'Total';

  @override
  String salesHistoryInvoiceNumber(String id) {
    return 'Invoice #$id';
  }

  @override
  String salesHistoryCashCount(int count) {
    return '$count cash';
  }

  @override
  String salesHistoryLedgerCount(int count) {
    return '$count ledger';
  }

  @override
  String get salesHistoryEmpty => 'No sales yet';

  @override
  String get salesHistoryEmptyHint => 'Completed sales will appear here';

  @override
  String get salesHistoryEmptyTitle => 'No sales today yet';

  @override
  String get salesHistoryEmptySubtitle =>
      'Open the Point of Sale to start ringing up customers.';

  @override
  String get salesHistoryEmptyAction => 'Open POS';

  @override
  String get salesHistoryFilterEmptyTitle => 'No sales match this filter';

  @override
  String get salesHistoryFilterEmptySubtitle =>
      'Try a different filter or clear the selection to see all sales.';

  @override
  String get salesHistorySearchHint => 'Search invoices…';

  @override
  String get salesHistorySearchEmptyTitle => 'No invoices found';

  @override
  String get salesHistorySearchEmptySubtitle =>
      'No receipts match your search. Try a different invoice number or keyword.';

  @override
  String get salesFilterAll => 'All';

  @override
  String get salesFilterCash => 'Cash';

  @override
  String get salesFilterLedger => 'Ledger';

  @override
  String get invoiceDetailsTitle => 'Invoice';

  @override
  String get invoiceSaleType => 'Sale Type';

  @override
  String get invoicePaymentStatus => 'Payment Status';

  @override
  String get invoiceDate => 'Date';

  @override
  String get invoiceItems => 'Items';

  @override
  String get paymentStatusPaid => 'Paid';

  @override
  String get paymentStatusPartiallyPaid => 'Partially Paid';

  @override
  String get paymentStatusUnpaid => 'Unpaid';

  @override
  String get inventoryTitle => 'Inventory';

  @override
  String get inventorySubtitle => 'Manage and track your store\'s products.';

  @override
  String get inventoryEmpty => 'No inventory items';

  @override
  String get inventoryEmptyHint => 'Products with stock will appear here';

  @override
  String get inventoryStockAdjustment => 'Stock Adjustment';

  @override
  String get inventoryCurrentStock => 'Current Stock';

  @override
  String get inventoryNewStock => 'New Stock';

  @override
  String get inventoryReasonLabel => 'Reason';

  @override
  String get inventoryAdjustSuccess => 'Stock updated successfully';

  @override
  String get inventoryLowStockBadge => 'Low Stock';

  @override
  String get inventoryInStock => 'In Stock';

  @override
  String get inventoryOutOfStock => 'Out of Stock';

  @override
  String get reportsTitle => 'Reports';

  @override
  String get reportsAnalyticsTitle => 'Reports & Analytics';

  @override
  String get reportsAnalyticsSubtitle =>
      'Overview of your store\'s performance.';

  @override
  String get reportsTotalRevenue => 'Total Revenue';

  @override
  String get reportsNetProfit => 'Net Profit';

  @override
  String get reportsLedgerOutstanding => 'Ledger Outstanding';

  @override
  String reportsFromCustomers(int count) {
    return 'From $count customers';
  }

  @override
  String get reportsViewDetails => 'View Details';

  @override
  String get reportsTopProductsVolume => 'Top Products (Volume)';

  @override
  String get reportsBestCustomersValue => 'Best Customers (Value)';

  @override
  String get reportsExport => 'Export';

  @override
  String get reportsSelectDateRange => 'Select date range';

  @override
  String get reportsStartDate => 'Start date';

  @override
  String get reportsEndDate => 'End date';

  @override
  String get reportsApply => 'Apply';

  @override
  String get reportsUnitsLabel => 'units';

  @override
  String reportsUnitsSold(int count) {
    return '$count units';
  }

  @override
  String reportsVisitsCount(int count) {
    return '$count visits';
  }

  @override
  String reportsGrowthFromPrevious(String percent) {
    return '$percent% from previous period';
  }

  @override
  String reportsProfitMargin(String percent) {
    return '$percent% margin';
  }

  @override
  String get reportsTotalSales => 'Total Sales';

  @override
  String get reportsCashSales => 'Cash Sales';

  @override
  String get reportsLedgerSales => 'Ledger Sales';

  @override
  String get reportsTopProducts => 'Top Products';

  @override
  String get reportsPeriodToday => 'Today';

  @override
  String get reportsPeriodWeek => 'This Week';

  @override
  String get reportsPeriodMonth => 'This Month';

  @override
  String get reportsEmpty => 'No report data for this period';

  @override
  String get reportsEmptyTitle => 'No data for this period';

  @override
  String get reportsEmptySubtitle =>
      'There were no sales recorded during the selected time range. Try a different period.';

  @override
  String get dialogDeleteTitle => 'Delete this item?';

  @override
  String get dialogDeleteMessage =>
      'This action cannot be undone and will permanently remove the item from your inventory.';

  @override
  String get dialogStockLowTitle => 'Stock Running Low';

  @override
  String get dialogReorderNow => 'Reorder Now';

  @override
  String get dialogPaymentSuccessTitle => 'Payment Successful';

  @override
  String get dialogPrintReceipt => 'Print Receipt';

  @override
  String get dialogDone => 'Done';

  @override
  String get dialogNoConnectionTitle => 'No Connection';

  @override
  String get dialogNoConnectionMessage =>
      'Please check your internet connection and try again.';

  @override
  String get dialogRetry => 'Retry';

  @override
  String get dialogProductNotFoundTitle => 'Product Not Found';

  @override
  String dialogProductNotFoundMessage(String barcode) {
    return 'The scanned barcode $barcode doesn\'t exist in your current inventory.';
  }

  @override
  String get dialogDismiss => 'Dismiss';

  @override
  String get dialogCreateProduct => 'Create Product';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsShopName => 'Shop Name';

  @override
  String get settingsCurrency => 'Currency';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLowStockAlert => 'Low Stock Alert Threshold';

  @override
  String get settingsReceiptFooter => 'Receipt Footer';

  @override
  String get settingsSaveSuccess => 'Settings saved successfully';

  @override
  String get settingsAbout => 'About ShopFlow';

  @override
  String get settingsVersion => 'Version';
}
