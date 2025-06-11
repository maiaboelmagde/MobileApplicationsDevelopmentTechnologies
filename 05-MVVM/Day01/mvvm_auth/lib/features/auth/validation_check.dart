class ValidationCheck {
  static String? nameCheck(value) {
    if (value == null || value.trim().isEmpty) {
      return 'user Name is required ..';
    } else if (!value.isValidName) {
      return 'Invalid user name, should contain only letters';
    }
    return null;
  }

  static String? emailCheck(value) {
    if (value == null || value.trim().isEmpty) {
      return 'user email is required ..';
    } else if (!value.isValidEmail) {
      return 'Invalid email !!';
    }
    return null;
  }

  static String? passwordCheck(value) {
    if (value == null || value.trim().isEmpty) {
      return 'password is required ..';
    } else if (!value.isValidPassword) {
      return 'Invalid pasword, should be more than 8 letters, contains upper/lower/special letters';
    }
    return null;
  }

  static String? passwordCofirmation(value, PaswordValue) {
    if (value == null || value.trim().isEmpty) {
      return 'Password confirmation is required ..';
    } else if (value != PaswordValue) {
      return "it doesn't match the password field";
    }
    return null;
  }
}
