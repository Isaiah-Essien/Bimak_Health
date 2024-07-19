/// Custom class to handle Firebase auth related exceptions
library;

class MFirebaseAuthException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code.
  MFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please provide another email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login credentials. User not found.';
      case 'wrong-password':
        return 'The password is incorrect. Please check the password and try again.';
      case 'invalid-verification-code':
        return 'The code you entered is incorrect. Please check the code and enter a valid one.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please request a valid ID.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }

  @override
  String toString() => 'MFirebaseAuthException(code: $code, message: $message)';
}
