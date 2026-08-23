import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'ShopFlow'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Smart POS for your shop'**
  String get appTagline;

  /// No description provided for @btnContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get btnContinue;

  /// No description provided for @btnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get btnCancel;

  /// No description provided for @btnConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get btnConfirm;

  /// No description provided for @btnSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get btnSave;

  /// No description provided for @btnDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get btnDelete;

  /// No description provided for @btnEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get btnEdit;

  /// No description provided for @btnRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get btnRetry;

  /// No description provided for @btnBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get btnBack;

  /// No description provided for @btnNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get btnNext;

  /// No description provided for @btnDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get btnDone;

  /// No description provided for @btnAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get btnAdd;

  /// No description provided for @btnSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get btnSearch;

  /// No description provided for @btnSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get btnSubmit;

  /// No description provided for @btnClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get btnClose;

  /// No description provided for @btnYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get btnYes;

  /// No description provided for @btnNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get btnNo;

  /// No description provided for @btnLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get btnLogout;

  /// No description provided for @labelLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get labelLoading;

  /// No description provided for @labelRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get labelRequired;

  /// No description provided for @labelOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get labelOptional;

  /// No description provided for @validationFullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get validationFullNameRequired;

  /// No description provided for @validationFullNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Full name must be at least 2 characters'**
  String get validationFullNameMinLength;

  /// No description provided for @validationShopNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your shop name'**
  String get validationShopNameRequired;

  /// No description provided for @validationShopNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Shop name must be at least 2 characters'**
  String get validationShopNameMinLength;

  /// No description provided for @validationPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number'**
  String get validationPhoneRequired;

  /// No description provided for @validationPhoneDigitsOnly.
  ///
  /// In en, this message translates to:
  /// **'Phone number can only contain digits'**
  String get validationPhoneDigitsOnly;

  /// No description provided for @validationPhoneInvalidPrefix.
  ///
  /// In en, this message translates to:
  /// **'Number must start with 03, +92, or 923'**
  String get validationPhoneInvalidPrefix;

  /// No description provided for @validationPhoneInvalidMobile.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid mobile number starting with 3'**
  String get validationPhoneInvalidMobile;

  /// No description provided for @validationPhoneTooShort.
  ///
  /// In en, this message translates to:
  /// **'Phone number is too short'**
  String get validationPhoneTooShort;

  /// No description provided for @validationPhoneTooLong.
  ///
  /// In en, this message translates to:
  /// **'Phone number is too long'**
  String get validationPhoneTooLong;

  /// No description provided for @validationPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Pakistani phone number'**
  String get validationPhoneInvalid;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get validationPasswordMinLength;

  /// No description provided for @validationConfirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get validationConfirmPasswordRequired;

  /// No description provided for @validationPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validationPasswordMismatch;

  /// No description provided for @validationOwnerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter owner name'**
  String get validationOwnerNameRequired;

  /// No description provided for @validationOwnerNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Owner name must be at least 2 characters'**
  String get validationOwnerNameMinLength;

  /// No description provided for @validationLoginIdentifierRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email or phone number'**
  String get validationLoginIdentifierRequired;

  /// No description provided for @validationCustomerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter customer name'**
  String get validationCustomerNameRequired;

  /// No description provided for @validationCustomerNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Customer name must be at least 2 characters'**
  String get validationCustomerNameMinLength;

  /// No description provided for @validationCategoryNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a category name'**
  String get validationCategoryNameRequired;

  /// No description provided for @validationCategoryNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Category name must be at least 2 characters'**
  String get validationCategoryNameMinLength;

  /// No description provided for @validationProductNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a product name'**
  String get validationProductNameRequired;

  /// No description provided for @validationProductNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Product name must be at least 2 characters'**
  String get validationProductNameMinLength;

  /// No description provided for @validationProductPriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter selling price'**
  String get validationProductPriceRequired;

  /// No description provided for @validationProductPriceInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid selling price'**
  String get validationProductPriceInvalid;

  /// No description provided for @validationProductCostRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter purchase price'**
  String get validationProductCostRequired;

  /// No description provided for @validationProductCostInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid purchase price'**
  String get validationProductCostInvalid;

  /// No description provided for @validationProductBarcodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a barcode'**
  String get validationProductBarcodeRequired;

  /// No description provided for @validationProductBarcodeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Barcode must be at least 3 characters'**
  String get validationProductBarcodeInvalid;

  /// No description provided for @validationProductStockRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter stock quantity'**
  String get validationProductStockRequired;

  /// No description provided for @validationProductStockInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid stock quantity'**
  String get validationProductStockInvalid;

  /// No description provided for @validationProductCategoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get validationProductCategoryRequired;

  /// No description provided for @validationInventoryStockRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter new stock quantity'**
  String get validationInventoryStockRequired;

  /// No description provided for @validationInventoryReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a reason for adjustment'**
  String get validationInventoryReasonRequired;

  /// No description provided for @msgSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get msgSomethingWentWrong;

  /// No description provided for @msgNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get msgNoInternet;

  /// No description provided for @msgSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get msgSuccess;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this? This action cannot be undone.'**
  String get confirmDeleteMessage;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get searchHint;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'ShopFlow'**
  String get splashTitle;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Sell Faster'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Checkout in seconds with barcode scanning and quick cart.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Track Everything'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Manage products, stock, customers, and ledger in one place.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Grow Your Shop'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Get insights with sales reports and inventory alerts.'**
  String get onboardingDesc3;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue to ShopFlow'**
  String get loginSubtitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone'**
  String get loginEmailLabel;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButton;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginForgotPassword;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// No description provided for @loginRegisterLink.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get loginRegisterLink;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your shop'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join ShopFlow to manage your inventory, sales, and orders seamlessly.'**
  String get registerSubtitle;

  /// No description provided for @registerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Owner Name'**
  String get registerNameLabel;

  /// No description provided for @registerOwnerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Owner Name'**
  String get registerOwnerNameLabel;

  /// No description provided for @registerShopNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Shop Name'**
  String get registerShopNameLabel;

  /// No description provided for @registerPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get registerPhoneLabel;

  /// No description provided for @registerEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerEmailLabel;

  /// No description provided for @registerPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPasswordLabel;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registerConfirmPasswordLabel;

  /// No description provided for @registerAddressOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Address (Optional)'**
  String get registerAddressOptionalLabel;

  /// No description provided for @registerAddLogo.
  ///
  /// In en, this message translates to:
  /// **'Add Logo'**
  String get registerAddLogo;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerButton;

  /// No description provided for @registerHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registerHaveAccount;

  /// No description provided for @registerLoginLink.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get registerLoginLink;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get otpTitle;

  /// No description provided for @otpVerifyPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Phone'**
  String get otpVerifyPhoneTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to your phone'**
  String get otpSubtitle;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to {phone}'**
  String otpSentTo(String phone);

  /// No description provided for @otpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get otpResend;

  /// No description provided for @otpResendPrompt.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get otpResendPrompt;

  /// No description provided for @otpResendNow.
  ///
  /// In en, this message translates to:
  /// **'Resend Now'**
  String get otpResendNow;

  /// No description provided for @otpVerifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get otpVerifyButton;

  /// No description provided for @otpDevCode.
  ///
  /// In en, this message translates to:
  /// **'Development OTP: {otp}'**
  String otpDevCode(String otp);

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered phone number to receive an OTP.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @forgotPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get forgotPasswordButton;

  /// No description provided for @forgotPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully'**
  String get forgotPasswordSuccess;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new secure password for your account.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetPasswordNewLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get resetPasswordNewLabel;

  /// No description provided for @resetPasswordNewHint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get resetPasswordNewHint;

  /// No description provided for @resetPasswordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get resetPasswordConfirmLabel;

  /// No description provided for @resetPasswordConfirmHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter new password'**
  String get resetPasswordConfirmHint;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get resetPasswordSuccess;

  /// No description provided for @resetPasswordRequirementLength.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get resetPasswordRequirementLength;

  /// No description provided for @resetPasswordRequirementNumber.
  ///
  /// In en, this message translates to:
  /// **'At least one number'**
  String get resetPasswordRequirementNumber;

  /// No description provided for @resetPasswordRequirementSpecial.
  ///
  /// In en, this message translates to:
  /// **'At least one special character'**
  String get resetPasswordRequirementSpecial;

  /// No description provided for @validationResetPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new password'**
  String get validationResetPasswordRequired;

  /// No description provided for @validationResetPasswordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Password does not meet the requirements'**
  String get validationResetPasswordInvalid;

  /// No description provided for @validationResetPasswordConfirmRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your new password'**
  String get validationResetPasswordConfirmRequired;

  /// No description provided for @authLoginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed in successfully'**
  String get authLoginSuccess;

  /// No description provided for @authRegisterSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get authRegisterSuccess;

  /// No description provided for @authLogoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get authLogoutConfirmTitle;

  /// No description provided for @authLogoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get authLogoutConfirmMessage;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardTodaySales.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sales'**
  String get dashboardTodaySales;

  /// No description provided for @dashboardTodayOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get dashboardTodayOrders;

  /// No description provided for @dashboardLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get dashboardLowStock;

  /// No description provided for @dashboardPendingLedger.
  ///
  /// In en, this message translates to:
  /// **'Pending Ledger'**
  String get dashboardPendingLedger;

  /// No description provided for @dashboardQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get dashboardQuickActions;

  /// No description provided for @dashboardNewSale.
  ///
  /// In en, this message translates to:
  /// **'New Sale'**
  String get dashboardNewSale;

  /// No description provided for @dashboardAddProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get dashboardAddProduct;

  /// No description provided for @dashboardAddCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get dashboardAddCustomer;

  /// No description provided for @dashboardViewReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get dashboardViewReports;

  /// No description provided for @dashboardEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No activity yet. Start a sale to see your dashboard fill up.'**
  String get dashboardEmptyMessage;

  /// No description provided for @dashboardGoodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get dashboardGoodMorning;

  /// No description provided for @dashboardGoodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get dashboardGoodAfternoon;

  /// No description provided for @dashboardGoodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get dashboardGoodEvening;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s what\'s happening today.'**
  String get dashboardSubtitle;

  /// No description provided for @dashboardSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search products, orders…'**
  String get dashboardSearchHint;

  /// No description provided for @dashboardSalesGrowth.
  ///
  /// In en, this message translates to:
  /// **'↑ {percent}% vs yesterday'**
  String dashboardSalesGrowth(double percent);

  /// No description provided for @dashboardPendingAccounts.
  ///
  /// In en, this message translates to:
  /// **'{count} accounts to collect today'**
  String dashboardPendingAccounts(int count);

  /// No description provided for @dashboardRequiresRestock.
  ///
  /// In en, this message translates to:
  /// **'Requires immediate restock'**
  String get dashboardRequiresRestock;

  /// No description provided for @dashboardLedger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get dashboardLedger;

  /// No description provided for @dashboardOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get dashboardOutstanding;

  /// No description provided for @dashboardAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get dashboardAlerts;

  /// No description provided for @dashboardLowInStock.
  ///
  /// In en, this message translates to:
  /// **'Low in stock'**
  String get dashboardLowInStock;

  /// No description provided for @dashboardTopSelling.
  ///
  /// In en, this message translates to:
  /// **'Top Selling'**
  String get dashboardTopSelling;

  /// No description provided for @dashboardTopSellingProducts.
  ///
  /// In en, this message translates to:
  /// **'Top Selling Products'**
  String get dashboardTopSellingProducts;

  /// No description provided for @dashboardRecentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get dashboardRecentTransactions;

  /// No description provided for @dashboardViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get dashboardViewAll;

  /// No description provided for @dashboardNavSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get dashboardNavSales;

  /// No description provided for @dashboardNavMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get dashboardNavMore;

  /// No description provided for @moreMenuPosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open checkout and start a new sale'**
  String get moreMenuPosSubtitle;

  /// No description provided for @moreMenuCustomersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage customer profiles and ledger accounts'**
  String get moreMenuCustomersSubtitle;

  /// No description provided for @moreMenuLedgerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View khata balances and record payments'**
  String get moreMenuLedgerSubtitle;

  /// No description provided for @moreMenuProductsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse and manage your product catalog'**
  String get moreMenuProductsSubtitle;

  /// No description provided for @moreMenuCategoriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Organize products into categories'**
  String get moreMenuCategoriesSubtitle;

  /// No description provided for @moreMenuReports.
  ///
  /// In en, this message translates to:
  /// **'Reports & Analytics'**
  String get moreMenuReports;

  /// No description provided for @moreMenuReportsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sales summaries and business insights'**
  String get moreMenuReportsSubtitle;

  /// No description provided for @moreMenuSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shop profile, preferences, and app settings'**
  String get moreMenuSettingsSubtitle;

  /// No description provided for @moreSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get moreSettingsTitle;

  /// No description provided for @moreMenuShopProfile.
  ///
  /// In en, this message translates to:
  /// **'Shop Profile'**
  String get moreMenuShopProfile;

  /// No description provided for @moreMenuReceiptSettings.
  ///
  /// In en, this message translates to:
  /// **'Receipt Settings'**
  String get moreMenuReceiptSettings;

  /// No description provided for @moreMenuPrinter.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get moreMenuPrinter;

  /// No description provided for @morePrinterComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Printer setup is coming soon.'**
  String get morePrinterComingSoon;

  /// No description provided for @moreLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get moreLanguageEnglish;

  /// No description provided for @moreLanguageUrdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get moreLanguageUrdu;

  /// No description provided for @moreLanguageSaved.
  ///
  /// In en, this message translates to:
  /// **'Language preference saved.'**
  String get moreLanguageSaved;

  /// No description provided for @moreAboutDescription.
  ///
  /// In en, this message translates to:
  /// **'ShopFlow POS for grocery and kiryana shops. Version 1.0.0'**
  String get moreAboutDescription;

  /// No description provided for @shopProfileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get shopProfileSaveChanges;

  /// No description provided for @shopProfileAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Shop Address'**
  String get shopProfileAddressLabel;

  /// No description provided for @shopProfileTaxNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax / NTN Number'**
  String get shopProfileTaxNumberLabel;

  /// No description provided for @shopLogoGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get shopLogoGallery;

  /// No description provided for @shopLogoCamera.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get shopLogoCamera;

  /// No description provided for @shopLogoRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove Logo'**
  String get shopLogoRemove;

  /// No description provided for @imagePickerRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get imagePickerRemove;

  /// No description provided for @languagePageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language for the entire app. Receipts and screens update automatically.'**
  String get languagePageSubtitle;

  /// No description provided for @receiptSettingsDisplaySection.
  ///
  /// In en, this message translates to:
  /// **'Display Options'**
  String get receiptSettingsDisplaySection;

  /// No description provided for @receiptSettingsNotesSection.
  ///
  /// In en, this message translates to:
  /// **'Notes & Numbering'**
  String get receiptSettingsNotesSection;

  /// No description provided for @receiptShowLogo.
  ///
  /// In en, this message translates to:
  /// **'Show shop logo'**
  String get receiptShowLogo;

  /// No description provided for @receiptShowAddress.
  ///
  /// In en, this message translates to:
  /// **'Show address'**
  String get receiptShowAddress;

  /// No description provided for @receiptShowPhone.
  ///
  /// In en, this message translates to:
  /// **'Show phone number'**
  String get receiptShowPhone;

  /// No description provided for @receiptShowTaxNumber.
  ///
  /// In en, this message translates to:
  /// **'Show tax / NTN number'**
  String get receiptShowTaxNumber;

  /// No description provided for @receiptShowCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Show customer name'**
  String get receiptShowCustomerName;

  /// No description provided for @receiptShowLedgerBalance.
  ///
  /// In en, this message translates to:
  /// **'Show ledger balance'**
  String get receiptShowLedgerBalance;

  /// No description provided for @receiptShowPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Show payment method'**
  String get receiptShowPaymentMethod;

  /// No description provided for @receiptShowCashierName.
  ///
  /// In en, this message translates to:
  /// **'Show cashier name'**
  String get receiptShowCashierName;

  /// No description provided for @receiptHeaderNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Header note'**
  String get receiptHeaderNoteLabel;

  /// No description provided for @receiptNumberPrefixLabel.
  ///
  /// In en, this message translates to:
  /// **'Receipt number prefix'**
  String get receiptNumberPrefixLabel;

  /// No description provided for @receiptPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Receipt Preview'**
  String get receiptPreviewTitle;

  /// No description provided for @receiptPreviewButton.
  ///
  /// In en, this message translates to:
  /// **'Preview Receipt'**
  String get receiptPreviewButton;

  /// No description provided for @receiptDownloadButton.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get receiptDownloadButton;

  /// No description provided for @receiptShareButton.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get receiptShareButton;

  /// No description provided for @dashboardOpenLedger.
  ///
  /// In en, this message translates to:
  /// **'Open Ledger'**
  String get dashboardOpenLedger;

  /// No description provided for @dashboardScanItem.
  ///
  /// In en, this message translates to:
  /// **'Scan Item'**
  String get dashboardScanItem;

  /// No description provided for @dashboardPrintLastBill.
  ///
  /// In en, this message translates to:
  /// **'Print Last Bill'**
  String get dashboardPrintLastBill;

  /// No description provided for @dashboardStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get dashboardStatusPaid;

  /// No description provided for @dashboardStatusLedger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get dashboardStatusLedger;

  /// No description provided for @dashboardItemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String dashboardItemsCount(int count);

  /// No description provided for @dashboardUnitsSold.
  ///
  /// In en, this message translates to:
  /// **'{count} units sold'**
  String dashboardUnitsSold(int count);

  /// No description provided for @dashboardColCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get dashboardColCustomer;

  /// No description provided for @dashboardColTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get dashboardColTime;

  /// No description provided for @dashboardColItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get dashboardColItems;

  /// No description provided for @dashboardColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get dashboardColStatus;

  /// No description provided for @dashboardColAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get dashboardColAmount;

  /// No description provided for @posTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get posTitle;

  /// No description provided for @posCartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get posCartEmpty;

  /// No description provided for @posCartEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Scan or search products to add them'**
  String get posCartEmptyHint;

  /// No description provided for @posTabProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get posTabProducts;

  /// No description provided for @posTabCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get posTabCart;

  /// No description provided for @posScanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get posScanBarcode;

  /// No description provided for @posSearchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search products…'**
  String get posSearchProduct;

  /// No description provided for @posSaleTypeCash.
  ///
  /// In en, this message translates to:
  /// **'Cash Sale'**
  String get posSaleTypeCash;

  /// No description provided for @posSaleTypeLedger.
  ///
  /// In en, this message translates to:
  /// **'Ledger Sale'**
  String get posSaleTypeLedger;

  /// No description provided for @posSelectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get posSelectCustomer;

  /// No description provided for @posChangeCustomer.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get posChangeCustomer;

  /// No description provided for @posPartialPayment.
  ///
  /// In en, this message translates to:
  /// **'Partial Payment'**
  String get posPartialPayment;

  /// No description provided for @posCashReceived.
  ///
  /// In en, this message translates to:
  /// **'Cash Received'**
  String get posCashReceived;

  /// No description provided for @posCashRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash amount required'**
  String get posCashRequiredTitle;

  /// No description provided for @posCashRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter the cash received from the customer before confirming this sale.'**
  String get posCashRequiredMessage;

  /// No description provided for @posInsufficientCashTitle.
  ///
  /// In en, this message translates to:
  /// **'Insufficient cash received'**
  String get posInsufficientCashTitle;

  /// No description provided for @posInsufficientCashMessage.
  ///
  /// In en, this message translates to:
  /// **'Cash received is less than the sale total. Switch to a Ledger Sale to record the remaining balance, or collect the full amount.'**
  String get posInsufficientCashMessage;

  /// No description provided for @posInsufficientCash.
  ///
  /// In en, this message translates to:
  /// **'Cash received is less than total'**
  String get posInsufficientCash;

  /// No description provided for @posShareWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Share on WhatsApp'**
  String get posShareWhatsApp;

  /// No description provided for @posViewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View Receipt'**
  String get posViewReceipt;

  /// No description provided for @posSharePhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer phone number'**
  String get posSharePhoneTitle;

  /// No description provided for @posSharePhoneMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter the WhatsApp number to send this receipt to.'**
  String get posSharePhoneMessage;

  /// No description provided for @posSwitchToLedgerSale.
  ///
  /// In en, this message translates to:
  /// **'Switch to Ledger Sale'**
  String get posSwitchToLedgerSale;

  /// No description provided for @posCustomerRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer required'**
  String get posCustomerRequiredTitle;

  /// No description provided for @posChangeDue.
  ///
  /// In en, this message translates to:
  /// **'Change Due'**
  String get posChangeDue;

  /// No description provided for @posSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get posSubtotal;

  /// No description provided for @posTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get posTotal;

  /// No description provided for @posQuantity.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get posQuantity;

  /// No description provided for @posQuantityByWeight.
  ///
  /// In en, this message translates to:
  /// **'By Weight'**
  String get posQuantityByWeight;

  /// No description provided for @posQuantityByAmount.
  ///
  /// In en, this message translates to:
  /// **'By Amount'**
  String get posQuantityByAmount;

  /// No description provided for @posQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity ({unit})'**
  String posQuantityLabel(String unit);

  /// No description provided for @posAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount (Rs.)'**
  String get posAmountLabel;

  /// No description provided for @posAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get posAddToCart;

  /// No description provided for @posAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get posAddedToCart;

  /// No description provided for @posLedgerLocked.
  ///
  /// In en, this message translates to:
  /// **'Ledger sale unavailable for cash customers'**
  String get posLedgerLocked;

  /// No description provided for @posLedgerRemainder.
  ///
  /// In en, this message translates to:
  /// **'Added to ledger'**
  String get posLedgerRemainder;

  /// No description provided for @posOutstandingBalance.
  ///
  /// In en, this message translates to:
  /// **'Outstanding balance'**
  String get posOutstandingBalance;

  /// No description provided for @posOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Product is out of stock'**
  String get posOutOfStock;

  /// No description provided for @posStockCapped.
  ///
  /// In en, this message translates to:
  /// **'Quantity capped to available stock'**
  String get posStockCapped;

  /// No description provided for @posCartDiscount.
  ///
  /// In en, this message translates to:
  /// **'Cart discount'**
  String get posCartDiscount;

  /// No description provided for @posItemDiscount.
  ///
  /// In en, this message translates to:
  /// **'Item discount'**
  String get posItemDiscount;

  /// No description provided for @posTax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get posTax;

  /// No description provided for @posConfirmSale.
  ///
  /// In en, this message translates to:
  /// **'Confirm Sale'**
  String get posConfirmSale;

  /// No description provided for @posSaleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Sale completed successfully'**
  String get posSaleSuccess;

  /// No description provided for @posResumeDraftTitle.
  ///
  /// In en, this message translates to:
  /// **'Resume previous sale?'**
  String get posResumeDraftTitle;

  /// No description provided for @posResumeDraftMessage.
  ///
  /// In en, this message translates to:
  /// **'You have an unfinished sale from your last session. Would you like to continue where you left off?'**
  String get posResumeDraftMessage;

  /// No description provided for @posResumeDraftConfirm.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get posResumeDraftConfirm;

  /// No description provided for @posResumeDraftDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get posResumeDraftDiscard;

  /// No description provided for @posClearCart.
  ///
  /// In en, this message translates to:
  /// **'Clear Cart'**
  String get posClearCart;

  /// No description provided for @posClearCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear cart?'**
  String get posClearCartTitle;

  /// No description provided for @posClearCartMessage.
  ///
  /// In en, this message translates to:
  /// **'This will remove all items and reset the current sale.'**
  String get posClearCartMessage;

  /// No description provided for @posClearCartConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear Cart'**
  String get posClearCartConfirm;

  /// No description provided for @posRemoveItemTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Item'**
  String get posRemoveItemTitle;

  /// No description provided for @posRemoveItemMessage.
  ///
  /// In en, this message translates to:
  /// **'Remove this item from the cart?'**
  String get posRemoveItemMessage;

  /// No description provided for @posCustomerRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a customer for ledger sale'**
  String get posCustomerRequired;

  /// No description provided for @barcodeScannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get barcodeScannerTitle;

  /// No description provided for @barcodeScannerHint.
  ///
  /// In en, this message translates to:
  /// **'Point camera at product barcode'**
  String get barcodeScannerHint;

  /// No description provided for @barcodeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Product not found for this barcode'**
  String get barcodeNotFound;

  /// No description provided for @productsTitle.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTitle;

  /// No description provided for @productsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse and manage your product catalog.'**
  String get productsSubtitle;

  /// No description provided for @productsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search products…'**
  String get productsSearchHint;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @loadMoreProducts.
  ///
  /// In en, this message translates to:
  /// **'Load More Products'**
  String get loadMoreProducts;

  /// No description provided for @productInStockCount.
  ///
  /// In en, this message translates to:
  /// **'{count} in stock'**
  String productInStockCount(int count);

  /// No description provided for @productLowStockCount.
  ///
  /// In en, this message translates to:
  /// **'Low Stock ({count})'**
  String productLowStockCount(int count);

  /// No description provided for @productSkuLabel.
  ///
  /// In en, this message translates to:
  /// **'SKU: {sku}'**
  String productSkuLabel(String sku);

  /// No description provided for @productActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get productActive;

  /// No description provided for @productRetailPrice.
  ///
  /// In en, this message translates to:
  /// **'Retail Price'**
  String get productRetailPrice;

  /// No description provided for @productCostValue.
  ///
  /// In en, this message translates to:
  /// **'Cost: {amount}'**
  String productCostValue(String amount);

  /// No description provided for @productUnits.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get productUnits;

  /// No description provided for @productReorderLevel.
  ///
  /// In en, this message translates to:
  /// **'Reorder level: {count} {unit}'**
  String productReorderLevel(int count, String unit);

  /// No description provided for @productSupplierDetails.
  ///
  /// In en, this message translates to:
  /// **'Supplier Details'**
  String get productSupplierDetails;

  /// No description provided for @productSupplierName.
  ///
  /// In en, this message translates to:
  /// **'Supplier Name'**
  String get productSupplierName;

  /// No description provided for @productContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get productContact;

  /// No description provided for @productLeadTime.
  ///
  /// In en, this message translates to:
  /// **'Lead Time'**
  String get productLeadTime;

  /// No description provided for @productLastOrdered.
  ///
  /// In en, this message translates to:
  /// **'Last Ordered'**
  String get productLastOrdered;

  /// No description provided for @productStockHistory.
  ///
  /// In en, this message translates to:
  /// **'Stock History'**
  String get productStockHistory;

  /// No description provided for @productViewFullHistory.
  ///
  /// In en, this message translates to:
  /// **'View Full History'**
  String get productViewFullHistory;

  /// No description provided for @productsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get productsEmpty;

  /// No description provided for @productsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Add your first product to get started'**
  String get productsEmptyHint;

  /// No description provided for @inventoryEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your inventory is empty'**
  String get inventoryEmptyTitle;

  /// No description provided for @inventoryEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start adding products to see them listed here and manage your stock.'**
  String get inventoryEmptySubtitle;

  /// No description provided for @inventoryEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Add your first product'**
  String get inventoryEmptyAction;

  /// No description provided for @productsSearchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get productsSearchEmptyTitle;

  /// No description provided for @productsSearchEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term or clear filters to see all products.'**
  String get productsSearchEmptySubtitle;

  /// No description provided for @inventoryLowStockEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing running low — you\'re all stocked up!'**
  String get inventoryLowStockEmptyTitle;

  /// No description provided for @inventoryLowStockEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'All products are above their low-stock threshold.'**
  String get inventoryLowStockEmptySubtitle;

  /// No description provided for @inventoryOutOfStockEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing out of stock right now.'**
  String get inventoryOutOfStockEmptyTitle;

  /// No description provided for @inventoryOutOfStockEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every product in your catalog currently has available stock.'**
  String get inventoryOutOfStockEmptySubtitle;

  /// No description provided for @inventoryFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get inventoryFilterAll;

  /// No description provided for @inventoryFilterLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get inventoryFilterLowStock;

  /// No description provided for @inventoryFilterOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get inventoryFilterOutOfStock;

  /// No description provided for @productsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get productsAdd;

  /// No description provided for @productsAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New Product'**
  String get productsAddNew;

  /// No description provided for @productsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get productsEdit;

  /// No description provided for @productsDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productsDetails;

  /// No description provided for @productNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productNameLabel;

  /// No description provided for @productNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Premium Rice 5kg'**
  String get productNameHint;

  /// No description provided for @productBarcodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get productBarcodeLabel;

  /// No description provided for @productBarcodeHint.
  ///
  /// In en, this message translates to:
  /// **'Scan or enter code'**
  String get productBarcodeHint;

  /// No description provided for @productGenerateQr.
  ///
  /// In en, this message translates to:
  /// **'Generate QR'**
  String get productGenerateQr;

  /// No description provided for @productCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get productCategoryLabel;

  /// No description provided for @productSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get productSelectCategory;

  /// No description provided for @productPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get productPriceLabel;

  /// No description provided for @productPurchasePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get productPurchasePriceLabel;

  /// No description provided for @productCostLabel.
  ///
  /// In en, this message translates to:
  /// **'Cost Price'**
  String get productCostLabel;

  /// No description provided for @productStockLabel.
  ///
  /// In en, this message translates to:
  /// **'Stock Qty'**
  String get productStockLabel;

  /// No description provided for @productStockQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Stock Quantity'**
  String get productStockQuantityLabel;

  /// No description provided for @productLowStockLabel.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Alert'**
  String get productLowStockLabel;

  /// No description provided for @productUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get productUnitLabel;

  /// No description provided for @productUnitPcs.
  ///
  /// In en, this message translates to:
  /// **'Pcs (Pieces)'**
  String get productUnitPcs;

  /// No description provided for @productUnitBag.
  ///
  /// In en, this message translates to:
  /// **'Bag'**
  String get productUnitBag;

  /// No description provided for @productUnitPack.
  ///
  /// In en, this message translates to:
  /// **'Pack'**
  String get productUnitPack;

  /// No description provided for @productUnitBottle.
  ///
  /// In en, this message translates to:
  /// **'Bottle'**
  String get productUnitBottle;

  /// No description provided for @productUnitKg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get productUnitKg;

  /// No description provided for @productUnitLiter.
  ///
  /// In en, this message translates to:
  /// **'Liter'**
  String get productUnitLiter;

  /// No description provided for @productDescriptionOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get productDescriptionOptionalLabel;

  /// No description provided for @productDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add details about the product…'**
  String get productDescriptionHint;

  /// No description provided for @productPhotoHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to add photo'**
  String get productPhotoHint;

  /// No description provided for @productSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Product'**
  String get productSaveButton;

  /// No description provided for @productUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get productUpdateButton;

  /// No description provided for @productSaveAndAddAnother.
  ///
  /// In en, this message translates to:
  /// **'Save & Add Another'**
  String get productSaveAndAddAnother;

  /// No description provided for @productSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Product saved successfully'**
  String get productSaveSuccess;

  /// No description provided for @productDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Product deleted successfully'**
  String get productDeleteSuccess;

  /// No description provided for @productDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get productDeactivate;

  /// No description provided for @productDeactivateTitle.
  ///
  /// In en, this message translates to:
  /// **'Deactivate product?'**
  String get productDeactivateTitle;

  /// No description provided for @productDeactivateMessage.
  ///
  /// In en, this message translates to:
  /// **'This product will be hidden from POS and new sales, but past invoices will remain intact.'**
  String get productDeactivateMessage;

  /// No description provided for @productDeactivateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Product deactivated successfully'**
  String get productDeactivateSuccess;

  /// No description provided for @productDeleteBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete product'**
  String get productDeleteBlockedTitle;

  /// No description provided for @productDeleteBlockedMessage.
  ///
  /// In en, this message translates to:
  /// **'This product has sales history. Deactivate it instead to hide it from POS while keeping records.'**
  String get productDeleteBlockedMessage;

  /// No description provided for @productInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get productInactive;

  /// No description provided for @productBarcodeExists.
  ///
  /// In en, this message translates to:
  /// **'This barcode is already used by another product'**
  String get productBarcodeExists;

  /// No description provided for @productPriceBelowCostWarning.
  ///
  /// In en, this message translates to:
  /// **'Selling price is below purchase price'**
  String get productPriceBelowCostWarning;

  /// No description provided for @productDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get productDeleteConfirm;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTitle;

  /// No description provided for @categoriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your store\'s inventory sections.'**
  String get categoriesSubtitle;

  /// No description provided for @categoriesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No categories yet'**
  String get categoriesEmpty;

  /// No description provided for @categoriesEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Create a category to organize products'**
  String get categoriesEmptyHint;

  /// No description provided for @categoriesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No categories yet'**
  String get categoriesEmptyTitle;

  /// No description provided for @categoriesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create categories to organize your products and speed up checkout.'**
  String get categoriesEmptySubtitle;

  /// No description provided for @categoriesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get categoriesAdd;

  /// No description provided for @categoryEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get categoryEditTitle;

  /// No description provided for @categoryNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryNameLabel;

  /// No description provided for @categoryNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Dairy Products'**
  String get categoryNameHint;

  /// No description provided for @categorySelectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get categorySelectIcon;

  /// No description provided for @categorySaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Category'**
  String get categorySaveButton;

  /// No description provided for @categorySaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Category saved successfully'**
  String get categorySaveSuccess;

  /// No description provided for @categoryDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Category deleted successfully'**
  String get categoryDeleteSuccess;

  /// No description provided for @categoryDeleteBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Category has products'**
  String get categoryDeleteBlockedTitle;

  /// No description provided for @categoryDeleteBlockedMessage.
  ///
  /// In en, this message translates to:
  /// **'{categoryName} has {count} product(s). Reassign them to another category before deleting.'**
  String categoryDeleteBlockedMessage(String categoryName, int count);

  /// No description provided for @categoryDeleteNoTargetMessage.
  ///
  /// In en, this message translates to:
  /// **'{categoryName} is the only category. Create another category before deleting this one.'**
  String categoryDeleteNoTargetMessage(String categoryName);

  /// No description provided for @categoryReassignTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Move products to'**
  String get categoryReassignTargetLabel;

  /// No description provided for @categoryReassignAndDelete.
  ///
  /// In en, this message translates to:
  /// **'Reassign & Delete'**
  String get categoryReassignAndDelete;

  /// No description provided for @categoryDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this category?'**
  String get categoryDeleteConfirm;

  /// No description provided for @customersTitle.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customersTitle;

  /// No description provided for @customersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your customer relationships and ledgers.'**
  String get customersSubtitle;

  /// No description provided for @customersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or phone…'**
  String get customersSearchHint;

  /// No description provided for @customersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No customers yet'**
  String get customersEmpty;

  /// No description provided for @customersEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Add a customer to start ledger sales'**
  String get customersEmptyHint;

  /// No description provided for @customersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No customers added'**
  String get customersEmptyTitle;

  /// No description provided for @customersEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep track of your regulars by adding them to your customer list.'**
  String get customersEmptySubtitle;

  /// No description provided for @customersAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get customersAdd;

  /// No description provided for @customersDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customersDetails;

  /// No description provided for @customerEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get customerEditTitle;

  /// No description provided for @customerAddSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the details for your new customer.'**
  String get customerAddSubtitle;

  /// No description provided for @customerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerNameLabel;

  /// No description provided for @customerPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get customerPhoneLabel;

  /// No description provided for @customerAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customerAddressLabel;

  /// No description provided for @customerNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get customerNotesLabel;

  /// No description provided for @customerNotesOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get customerNotesOptionalLabel;

  /// No description provided for @customerBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get customerBalanceLabel;

  /// No description provided for @customerPendingLedger.
  ///
  /// In en, this message translates to:
  /// **'Pending Ledger'**
  String get customerPendingLedger;

  /// No description provided for @customerTotalLedgerBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Ledger Balance'**
  String get customerTotalLedgerBalance;

  /// No description provided for @customerPendingSettlement.
  ///
  /// In en, this message translates to:
  /// **'Pending Settlement'**
  String get customerPendingSettlement;

  /// No description provided for @customerTabHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get customerTabHistory;

  /// No description provided for @customerTabPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get customerTabPayments;

  /// No description provided for @customerTabNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get customerTabNotes;

  /// No description provided for @customerStatusClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get customerStatusClear;

  /// No description provided for @customerStatusUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get customerStatusUnpaid;

  /// No description provided for @customerStatusSettled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get customerStatusSettled;

  /// No description provided for @customerLedgerSale.
  ///
  /// In en, this message translates to:
  /// **'Ledger Sale'**
  String get customerLedgerSale;

  /// No description provided for @customerPaymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Payment Received'**
  String get customerPaymentReceived;

  /// No description provided for @customerNoPayments.
  ///
  /// In en, this message translates to:
  /// **'No payments recorded yet'**
  String get customerNoPayments;

  /// No description provided for @customerNoNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes for this customer'**
  String get customerNoNotes;

  /// No description provided for @customerSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Customer'**
  String get customerSaveButton;

  /// No description provided for @customerSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer saved successfully'**
  String get customerSaveSuccess;

  /// No description provided for @customerDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer deleted successfully'**
  String get customerDeleteSuccess;

  /// No description provided for @customerDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this customer?'**
  String get customerDeleteConfirm;

  /// No description provided for @ledgerTitle.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get ledgerTitle;

  /// No description provided for @ledgerSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or phone…'**
  String get ledgerSearchHint;

  /// No description provided for @ledgerSearchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No ledger customers found'**
  String get ledgerSearchEmptyTitle;

  /// No description provided for @ledgerSearchEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try a different name or phone number.'**
  String get ledgerSearchEmptySubtitle;

  /// No description provided for @ledgerEmpty.
  ///
  /// In en, this message translates to:
  /// **'No ledger customers'**
  String get ledgerEmpty;

  /// No description provided for @ledgerEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Ledger customers appear after ledger sales'**
  String get ledgerEmptyHint;

  /// No description provided for @ledgerClearTitle.
  ///
  /// In en, this message translates to:
  /// **'All ledgers are clear'**
  String get ledgerClearTitle;

  /// No description provided for @ledgerClearSubtitle.
  ///
  /// In en, this message translates to:
  /// **'There are no outstanding balances or recent transactions to display.'**
  String get ledgerClearSubtitle;

  /// No description provided for @ledgerClearAction.
  ///
  /// In en, this message translates to:
  /// **'View Reports'**
  String get ledgerClearAction;

  /// No description provided for @ledgerStatementEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get ledgerStatementEmptyTitle;

  /// No description provided for @ledgerStatementEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Transactions will appear here once sales or payments are recorded.'**
  String get ledgerStatementEmptySubtitle;

  /// No description provided for @ledgerStatement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get ledgerStatement;

  /// No description provided for @ledgerRecordPayment.
  ///
  /// In en, this message translates to:
  /// **'Record Payment'**
  String get ledgerRecordPayment;

  /// No description provided for @ledgerRecordPaymentHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the payment amount to reduce the customer\'s ledger balance.'**
  String get ledgerRecordPaymentHint;

  /// No description provided for @ledgerOutstandingAmount.
  ///
  /// In en, this message translates to:
  /// **'Outstanding: {amount}'**
  String ledgerOutstandingAmount(String amount);

  /// No description provided for @ledgerAmountReceived.
  ///
  /// In en, this message translates to:
  /// **'Amount Received'**
  String get ledgerAmountReceived;

  /// No description provided for @ledgerFullPayment.
  ///
  /// In en, this message translates to:
  /// **'Full Payment'**
  String get ledgerFullPayment;

  /// No description provided for @ledgerPartialPayment.
  ///
  /// In en, this message translates to:
  /// **'Partial Payment'**
  String get ledgerPartialPayment;

  /// No description provided for @ledgerPaymentMethodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get ledgerPaymentMethodCash;

  /// No description provided for @ledgerNotesOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get ledgerNotesOptionalLabel;

  /// No description provided for @ledgerConfirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get ledgerConfirmPayment;

  /// No description provided for @ledgerTotalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get ledgerTotalBalance;

  /// No description provided for @ledgerDue.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get ledgerDue;

  /// No description provided for @ledgerKhataTag.
  ///
  /// In en, this message translates to:
  /// **'Khata: #{number}'**
  String ledgerKhataTag(String number);

  /// No description provided for @ledgerRegularCustomer.
  ///
  /// In en, this message translates to:
  /// **'Regular Customer'**
  String get ledgerRegularCustomer;

  /// No description provided for @ledgerOpeningBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get ledgerOpeningBalance;

  /// No description provided for @ledgerEntrySale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get ledgerEntrySale;

  /// No description provided for @ledgerEntryPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get ledgerEntryPayment;

  /// No description provided for @ledgerBillReference.
  ///
  /// In en, this message translates to:
  /// **'Bill {billId}'**
  String ledgerBillReference(String billId);

  /// No description provided for @ledgerRunningBalance.
  ///
  /// In en, this message translates to:
  /// **'{amount} Dr'**
  String ledgerRunningBalance(String amount);

  /// No description provided for @ledgerStatementEnd.
  ///
  /// In en, this message translates to:
  /// **'End of statement for selected period'**
  String get ledgerStatementEnd;

  /// No description provided for @ledgerShareStatement.
  ///
  /// In en, this message translates to:
  /// **'Share Statement'**
  String get ledgerShareStatement;

  /// No description provided for @ledgerAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get ledgerAmountLabel;

  /// No description provided for @ledgerPaymentMethodLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get ledgerPaymentMethodLabel;

  /// No description provided for @ledgerNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get ledgerNotesLabel;

  /// No description provided for @ledgerPaymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment recorded successfully'**
  String get ledgerPaymentSuccess;

  /// No description provided for @ledgerOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get ledgerOutstanding;

  /// No description provided for @ledgerTotalDebit.
  ///
  /// In en, this message translates to:
  /// **'Total Debit'**
  String get ledgerTotalDebit;

  /// No description provided for @ledgerTotalCredit.
  ///
  /// In en, this message translates to:
  /// **'Total Credit'**
  String get ledgerTotalCredit;

  /// No description provided for @ledgerBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get ledgerBalance;

  /// No description provided for @ledgerNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get ledgerNoEntries;

  /// No description provided for @salesHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales History'**
  String get salesHistoryTitle;

  /// No description provided for @salesHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse and filter cash and ledger transactions'**
  String get salesHistorySubtitle;

  /// No description provided for @salesHistorySalesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} sales'**
  String salesHistorySalesCount(int count);

  /// No description provided for @salesHistoryTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get salesHistoryTotalLabel;

  /// No description provided for @salesHistoryInvoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice #{id}'**
  String salesHistoryInvoiceNumber(String id);

  /// No description provided for @salesHistoryCashCount.
  ///
  /// In en, this message translates to:
  /// **'{count} cash'**
  String salesHistoryCashCount(int count);

  /// No description provided for @salesHistoryLedgerCount.
  ///
  /// In en, this message translates to:
  /// **'{count} ledger'**
  String salesHistoryLedgerCount(int count);

  /// No description provided for @salesHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No sales yet'**
  String get salesHistoryEmpty;

  /// No description provided for @salesHistoryEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Completed sales will appear here'**
  String get salesHistoryEmptyHint;

  /// No description provided for @salesHistoryEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No sales today yet'**
  String get salesHistoryEmptyTitle;

  /// No description provided for @salesHistoryEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open the Point of Sale to start ringing up customers.'**
  String get salesHistoryEmptySubtitle;

  /// No description provided for @salesHistoryEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Open POS'**
  String get salesHistoryEmptyAction;

  /// No description provided for @salesHistoryFilterEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No sales match this filter'**
  String get salesHistoryFilterEmptyTitle;

  /// No description provided for @salesHistoryFilterEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try a different filter or clear the selection to see all sales.'**
  String get salesHistoryFilterEmptySubtitle;

  /// No description provided for @salesHistorySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search invoices…'**
  String get salesHistorySearchHint;

  /// No description provided for @salesHistorySearchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No invoices found'**
  String get salesHistorySearchEmptyTitle;

  /// No description provided for @salesHistorySearchEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'No receipts match your search. Try a different invoice number or keyword.'**
  String get salesHistorySearchEmptySubtitle;

  /// No description provided for @salesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get salesFilterAll;

  /// No description provided for @salesFilterCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get salesFilterCash;

  /// No description provided for @salesFilterLedger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get salesFilterLedger;

  /// No description provided for @invoiceDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoiceDetailsTitle;

  /// No description provided for @invoiceSaleType.
  ///
  /// In en, this message translates to:
  /// **'Sale Type'**
  String get invoiceSaleType;

  /// No description provided for @invoicePaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get invoicePaymentStatus;

  /// No description provided for @invoiceDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get invoiceDate;

  /// No description provided for @invoiceItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get invoiceItems;

  /// No description provided for @paymentStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paymentStatusPaid;

  /// No description provided for @paymentStatusPartiallyPaid.
  ///
  /// In en, this message translates to:
  /// **'Partially Paid'**
  String get paymentStatusPartiallyPaid;

  /// No description provided for @paymentStatusUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get paymentStatusUnpaid;

  /// No description provided for @inventoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventoryTitle;

  /// No description provided for @inventorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage and track your store\'s products.'**
  String get inventorySubtitle;

  /// No description provided for @inventoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No inventory items'**
  String get inventoryEmpty;

  /// No description provided for @inventoryEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Products with stock will appear here'**
  String get inventoryEmptyHint;

  /// No description provided for @inventoryStockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment'**
  String get inventoryStockAdjustment;

  /// No description provided for @inventoryCurrentStock.
  ///
  /// In en, this message translates to:
  /// **'Current Stock'**
  String get inventoryCurrentStock;

  /// No description provided for @inventoryNewStock.
  ///
  /// In en, this message translates to:
  /// **'New Stock'**
  String get inventoryNewStock;

  /// No description provided for @inventoryReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get inventoryReasonLabel;

  /// No description provided for @inventoryAdjustSuccess.
  ///
  /// In en, this message translates to:
  /// **'Stock updated successfully'**
  String get inventoryAdjustSuccess;

  /// No description provided for @inventoryLowStockBadge.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get inventoryLowStockBadge;

  /// No description provided for @inventoryInStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inventoryInStock;

  /// No description provided for @inventoryOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get inventoryOutOfStock;

  /// No description provided for @reportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// No description provided for @reportsAnalyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports & Analytics'**
  String get reportsAnalyticsTitle;

  /// No description provided for @reportsAnalyticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Overview of your store\'s performance.'**
  String get reportsAnalyticsSubtitle;

  /// No description provided for @reportsTotalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get reportsTotalRevenue;

  /// No description provided for @reportsNetProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get reportsNetProfit;

  /// No description provided for @reportsLedgerOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Ledger Outstanding'**
  String get reportsLedgerOutstanding;

  /// No description provided for @reportsFromCustomers.
  ///
  /// In en, this message translates to:
  /// **'From {count} customers'**
  String reportsFromCustomers(int count);

  /// No description provided for @reportsViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get reportsViewDetails;

  /// No description provided for @reportsTopProductsVolume.
  ///
  /// In en, this message translates to:
  /// **'Top Products (Volume)'**
  String get reportsTopProductsVolume;

  /// No description provided for @reportsBestCustomersValue.
  ///
  /// In en, this message translates to:
  /// **'Best Customers (Value)'**
  String get reportsBestCustomersValue;

  /// No description provided for @reportsExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get reportsExport;

  /// No description provided for @reportsSelectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range'**
  String get reportsSelectDateRange;

  /// No description provided for @reportsStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get reportsStartDate;

  /// No description provided for @reportsEndDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get reportsEndDate;

  /// No description provided for @reportsApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get reportsApply;

  /// No description provided for @reportsUnitsLabel.
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get reportsUnitsLabel;

  /// No description provided for @reportsUnitsSold.
  ///
  /// In en, this message translates to:
  /// **'{count} units'**
  String reportsUnitsSold(int count);

  /// No description provided for @reportsVisitsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} visits'**
  String reportsVisitsCount(int count);

  /// No description provided for @reportsGrowthFromPrevious.
  ///
  /// In en, this message translates to:
  /// **'{percent}% from previous period'**
  String reportsGrowthFromPrevious(String percent);

  /// No description provided for @reportsProfitMargin.
  ///
  /// In en, this message translates to:
  /// **'{percent}% margin'**
  String reportsProfitMargin(String percent);

  /// No description provided for @reportsTotalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get reportsTotalSales;

  /// No description provided for @reportsCashSales.
  ///
  /// In en, this message translates to:
  /// **'Cash Sales'**
  String get reportsCashSales;

  /// No description provided for @reportsLedgerSales.
  ///
  /// In en, this message translates to:
  /// **'Ledger Sales'**
  String get reportsLedgerSales;

  /// No description provided for @reportsTopProducts.
  ///
  /// In en, this message translates to:
  /// **'Top Products'**
  String get reportsTopProducts;

  /// No description provided for @reportsPeriodToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get reportsPeriodToday;

  /// No description provided for @reportsPeriodWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get reportsPeriodWeek;

  /// No description provided for @reportsPeriodMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get reportsPeriodMonth;

  /// No description provided for @reportsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No report data for this period'**
  String get reportsEmpty;

  /// No description provided for @reportsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No data for this period'**
  String get reportsEmptyTitle;

  /// No description provided for @reportsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'There were no sales recorded during the selected time range. Try a different period.'**
  String get reportsEmptySubtitle;

  /// No description provided for @dialogDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this item?'**
  String get dialogDeleteTitle;

  /// No description provided for @dialogDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone and will permanently remove the item from your inventory.'**
  String get dialogDeleteMessage;

  /// No description provided for @dialogStockLowTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock Running Low'**
  String get dialogStockLowTitle;

  /// No description provided for @dialogReorderNow.
  ///
  /// In en, this message translates to:
  /// **'Reorder Now'**
  String get dialogReorderNow;

  /// No description provided for @dialogPaymentSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get dialogPaymentSuccessTitle;

  /// No description provided for @dialogPrintReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print Receipt'**
  String get dialogPrintReceipt;

  /// No description provided for @dialogDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get dialogDone;

  /// No description provided for @dialogNoConnectionTitle.
  ///
  /// In en, this message translates to:
  /// **'No Connection'**
  String get dialogNoConnectionTitle;

  /// No description provided for @dialogNoConnectionMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get dialogNoConnectionMessage;

  /// No description provided for @dialogRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get dialogRetry;

  /// No description provided for @dialogProductNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Product Not Found'**
  String get dialogProductNotFoundTitle;

  /// No description provided for @dialogProductNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The scanned barcode {barcode} doesn\'t exist in your current inventory.'**
  String dialogProductNotFoundMessage(String barcode);

  /// No description provided for @dialogDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dialogDismiss;

  /// No description provided for @dialogCreateProduct.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get dialogCreateProduct;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsShopName.
  ///
  /// In en, this message translates to:
  /// **'Shop Name'**
  String get settingsShopName;

  /// No description provided for @settingsCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settingsCurrency;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLowStockAlert.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Alert Threshold'**
  String get settingsLowStockAlert;

  /// No description provided for @settingsReceiptFooter.
  ///
  /// In en, this message translates to:
  /// **'Receipt Footer'**
  String get settingsReceiptFooter;

  /// No description provided for @settingsSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Settings saved successfully'**
  String get settingsSaveSuccess;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About ShopFlow'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
