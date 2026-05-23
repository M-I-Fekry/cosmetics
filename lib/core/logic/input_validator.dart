class InputValidator {
  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    } else if (value.length < 10) {
      return "Phone must be at least 10 digits";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 digits";
    }
    return null;
  }
}
