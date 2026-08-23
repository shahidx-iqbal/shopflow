/// Common form validators returning [String?] for TextFormField validators.
class Validators {
  Validators._();

  /// Returns [errorMessage] when [value] is null or blank.
  static String? required(
    String? value, {
    String errorMessage = 'Required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  /// Validates a basic email format.
  static String? email(
    String? value, {
    String requiredMessage = 'Required',
    String invalidMessage = 'Enter a valid email',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }
    final emailRegex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return invalidMessage;
    }
    return null;
  }

  /// Validates email only when the field is not empty.
  static String? optionalEmail(
    String? value, {
    String invalidMessage = 'Enter a valid email',
  }) {
    if (value == null || value.trim().isEmpty) return null;
    return email(value, invalidMessage: invalidMessage);
  }

  /// Validates a phone number (Pakistani mobile format).
  static String? phone(
    String? value, {
    PhoneValidationMessages messages = const PhoneValidationMessages(),
  }) {
    if (value == null || value.trim().isEmpty) {
      return messages.required;
    }

    final cleaned = value.trim().replaceAll(RegExp(r'[\s\-]'), '');

    if (!RegExp(r'^\+?\d+$').hasMatch(cleaned)) {
      return messages.digitsOnly;
    }

    final String digitsAfterPrefix;
    if (cleaned.startsWith('+92')) {
      digitsAfterPrefix = cleaned.substring(3);
    } else if (cleaned.startsWith('92')) {
      digitsAfterPrefix = cleaned.substring(2);
    } else if (cleaned.startsWith('0')) {
      digitsAfterPrefix = cleaned.substring(1);
    } else {
      return messages.invalidPrefix;
    }

    if (!digitsAfterPrefix.startsWith('3')) {
      return messages.invalidMobile;
    }

    if (digitsAfterPrefix.length < 10) {
      return messages.tooShort;
    }
    if (digitsAfterPrefix.length > 10) {
      return messages.tooLong;
    }

    final pakPhoneRegex = RegExp(r'^(?:\+92|92|0)3\d{9}$');
    if (!pakPhoneRegex.hasMatch(cleaned)) {
      return messages.invalid;
    }

    return null;
  }

  /// Validates minimum string length.
  static String? minLength(
    String? value,
    int min, {
    String? requiredMessage,
    String? minLengthMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    if (value.trim().length < min) {
      return minLengthMessage ?? 'Must be at least $min characters';
    }
    return null;
  }

  /// Validates that [value] can be parsed as a non-negative number.
  static String? positiveNumber(
    String? value, {
    String? requiredMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    final number = double.tryParse(value.trim());
    if (number == null || number < 0) {
      return invalidMessage ?? 'Enter a valid amount';
    }
    return null;
  }

  /// Validates a non-negative whole number (stock quantities).
  static String? nonNegativeInteger(
    String? value, {
    String? requiredMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    final parsed = int.tryParse(value.trim());
    if (parsed == null || parsed < 0) {
      return invalidMessage ?? 'Enter a valid quantity';
    }
    return null;
  }

  /// Validates a product barcode (required, minimum length).
  static String? barcode(
    String? value, {
    String? requiredMessage,
    String? invalidMessage,
    int minLength = 3,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    if (value.trim().length < minLength) {
      return invalidMessage ?? 'Enter a valid barcode';
    }
    return null;
  }

  /// Validates that [value] matches [originalPassword].
  static String? confirmPassword(
    String? value,
    String originalPassword, {
    String? requiredMessage,
    String? mismatchMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    if (value != originalPassword) {
      return mismatchMessage ?? 'Passwords do not match';
    }
    return null;
  }

  /// Validates a strong password (8+ chars, number, special character).
  static String? strongPassword(
    String? value, {
    String? requiredMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? 'Required';
    }
    if (!PasswordStrengthRules.evaluate(value).isValid) {
      return invalidMessage ?? 'Password does not meet requirements';
    }
    return null;
  }
}

/// Password strength rules for reset-password UI and validation.
class PasswordStrengthRules {
  PasswordStrengthRules._();

  static const int minLength = 8;

  static PasswordStrengthChecks evaluate(String password) {
    final hasMinLength = password.length >= minLength;
    final hasNumber = RegExp(r'\d').hasMatch(password);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\[\]\\;/+=~`]')
        .hasMatch(password);

    return PasswordStrengthChecks(
      hasMinLength: hasMinLength,
      hasNumber: hasNumber,
      hasSpecialChar: hasSpecialChar,
    );
  }
}

class PasswordStrengthChecks {
  const PasswordStrengthChecks({
    required this.hasMinLength,
    required this.hasNumber,
    required this.hasSpecialChar,
  });

  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  bool get isValid => hasMinLength && hasNumber && hasSpecialChar;
}

/// Localized messages for [Validators.phone].
class PhoneValidationMessages {
  const PhoneValidationMessages({
    this.required = 'Please enter a phone number',
    this.digitsOnly = 'Phone number can only contain digits',
    this.invalidPrefix = 'Number must start with 03, +92, or 923',
    this.invalidMobile = 'Enter a valid mobile number starting with 3',
    this.tooShort = 'Phone number is too short',
    this.tooLong = 'Phone number is too long',
    this.invalid = 'Enter a valid Pakistani phone number',
  });

  final String required;
  final String digitsOnly;
  final String invalidPrefix;
  final String invalidMobile;
  final String tooShort;
  final String tooLong;
  final String invalid;
}
