/// Custom class to handle platform-related exceptions
library;

class MPlatformException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code.
  MPlatformException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'The login credentials provided are invalid. Please check your username and password.';
      case 'too-many-requests':
        return 'Too many requests have been made in a short period. Please try again later.';
      case 'too-many-arguments':
        return 'Too many arguments have been provided. Please check the input and try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support for assistance.';
      case 'network-request-failed':
        return 'A network error occurred. Please check your internet connection and try again.';
      case 'timeout':
        return 'The operation timed out. Please try again later.';
      case 'user-token-expired':
        return 'The user token has expired. Please log in again.';
      case 'permission-denied':
        return 'You do not have permission to perform this action. Please contact support for assistance.';
      case 'unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'invalid-api-key':
        return 'The API key provided is invalid. Please check your API key and try again.';
      case 'invalid-user-token':
        return 'The user token provided is invalid. Please log in again.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'No user found with the provided credentials. Please check and try again.';
      case 'invalid-password':
        return 'The Password you entered is incorrect.Please enter the correct password';
      case 'invalid-phone-number':
        return 'The phone number you entered is invalid.Please enter a valid phone';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }

  @override
  String toString() => 'MPlatformException(code: $code, message: $message)';
}
