/// Custom class to handle various format-related errors.
class MFormatException implements Exception {
  /// The associated error message
  final String message;

  /// Default constructor with a generic error message
  const MFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message
  factory MFormatException.fromMessage(String message) {
    return MFormatException(message);
  }

  /// Get the corresponding format exception error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code
  factory MFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MFormatException(
            'The email address is invalid. Please enter a valid email.');
      case 'invalid-phone-number':
        return const MFormatException(
            'The phone number is invalid. Please enter a valid phone number.');
      case 'invalid-date':
        return const MFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-numeric':
        return const MFormatException(
            'The numeric value is invalid. Please enter a valid number.');
      case 'invalid-credit-card-number':
        return const MFormatException(
            'The credit card number is invalid. Please enter a valid credit card number.');
      case 'invalid-age':
        return const MFormatException(
            'The age is invalid. Please enter a valid age.');
      case 'invalid-zip-code':
        return const MFormatException(
            'The ZIP code is invalid. Please enter a valid ZIP code.');
      case 'invalid-ssn':
        return const MFormatException(
            'The Social Security Number is invalid. Please enter a valid SSN.');
      default:
        return const MFormatException();
    }
  }

  @override
  String toString() => 'MFormatException(message: $formattedMessage)';
}
