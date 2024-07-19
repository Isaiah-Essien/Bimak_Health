class MValidator {
  ///Empty text Validator
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regex for Email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Check for password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for Uppercase in password
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for Number in password
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special character in password
    if (!value.contains(RegExp(r'[!@#$%^&*()<>?":|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    // Regex for Rwandan Phone Number (local or international format)
    final phoneRegExp = RegExp(r'^(\+250\d{9}|079\d{8})$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid Phone Number (Rwandan number required)';
    }
    return null;
  }
}
