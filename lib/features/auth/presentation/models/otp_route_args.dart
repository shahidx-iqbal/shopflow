/// Purpose of the OTP verification screen.
enum OtpPurpose {
  registration,
  passwordReset,
}

/// Route arguments for [OtpVerificationPage].
class OtpRouteArgs {
  const OtpRouteArgs({
    required this.phone,
    required this.purpose,
    this.debugOtp,
  });

  final String phone;
  final OtpPurpose purpose;

  /// Present when the API echoes an OTP (development only, no SMS).
  final String? debugOtp;
}
