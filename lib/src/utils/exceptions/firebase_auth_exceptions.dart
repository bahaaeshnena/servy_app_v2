class TFirebaseAuthExecption implements Exception {
  final String code;

  TFirebaseAuthExecption(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return ' The email address is already registered.Please use a different email';

      case 'invalid-email':
        return 'the email address provided is invalid. please enter a valid email';
      case 'Weak-password':
        return 'Please enter a stronger password.';

      case 'user-disabled':
        return 'This user has been disabled. Please contact support for help.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';

      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';

      case 'invalid-verification-code':
        return 'invalid verification code . Please enter a valid code.';

      case 'invalid-verification-id':
        return 'invalid verification ID . Please request a new verification code.';

      case 'quote-exceeded':
        return 'Quote exceeded. Please try again later.';

      case 'email-already-exists':
        return 'The email address already exists.PLease use a different email';

      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      default:
        return 'An unexpected Firebase error occurred. PLease try again';
    }
  }
}
