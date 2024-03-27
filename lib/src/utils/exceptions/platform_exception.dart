class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'invalid login credentials. Please double-check your information.';
      case 'too-many-request':
        return 'Too many request.Please try again later.';
      case 'invalid-password':
        return 'Incorrect password.Please try again later.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'Sign-in-failed':
        return 'Sign-in failed.Please try again later.';
      case 'network-request-failed':
        return 'Network request failed.Please check your internet connection.';
      default:
        return 'An unexpected Firebase error occurred. PLease try again.';
    }
  }
}
