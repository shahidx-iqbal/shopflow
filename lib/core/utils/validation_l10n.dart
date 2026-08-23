import '../../l10n/app_localizations.dart';
import 'validators.dart';

/// Maps [AppLocalizations] strings to shared validator message bundles.
extension ValidationL10n on AppLocalizations {
  PhoneValidationMessages get phoneValidationMessages => PhoneValidationMessages(
        required: validationPhoneRequired,
        digitsOnly: validationPhoneDigitsOnly,
        invalidPrefix: validationPhoneInvalidPrefix,
        invalidMobile: validationPhoneInvalidMobile,
        tooShort: validationPhoneTooShort,
        tooLong: validationPhoneTooLong,
        invalid: validationPhoneInvalid,
      );
}
