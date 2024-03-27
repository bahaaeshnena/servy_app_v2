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

      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';

      case 'credential-already-in-use':
        return 'This credential is already assoviated with a different user account.';

      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';

      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';

      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';

      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'user-token-expired':
        return 'the user\'s token hax expired, and authentication is required. Please sign in again.';

      case 'uid-already-exists':
        return 'The provided user ID is already is use by another user.';

      case 'app-deleted':
        return 'This instance of FireBAseApp has been deleted.';

      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';

      case 'credential-already-use':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An unexpected Firebase error occurred. PLease try again.';
    }
  }
}
