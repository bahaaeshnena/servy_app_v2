class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'An unexpected Firebase error occurred. PLease try again. ']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formttedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException(
            'The email address format is invalid.Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'TThe provided phone number format is invalid.Please enter a valid number.');
      case 'invalid-date-format':
        return const TFormatException(
            'The date format is invalid.Please enter a valid date.');
      case 'invalid-url-format':
        return const TFormatException(
            'The URL format is invalid.Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'The credit card format is invalid.Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const TFormatException(
            'The numeric format is invalid.Please enter a valid numeric format.');
      default:
        return const TFormatException();
    }
  }
}
