/// Custom class to handle Firebase auth related exceptions
library;

class MFirebaseException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code.
  MFirebaseException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred.';
      case 'invalid-custom-token':
        return 'The custom token format is invalid. Please check your custom token.';
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
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please provide another email.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support for assistance.';
      case 'too-many-requests':
        return 'You have made too many requests in a short period. Please try again later.';
      case 'invalid-credential':
        return 'The provided credential is invalid. Please check your credential and try again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection and try again.';
      case 'invalid-api-key':
        return 'Your API key is invalid. Please check your API key and try again.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-token-expired':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'email-already-exists':
        return 'The email address is already registered. Please use a different email.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }

  @override
  String toString() => 'MFirebaseException(code: $code, message: $message)';
}
