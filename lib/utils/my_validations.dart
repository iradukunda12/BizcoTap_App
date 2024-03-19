class MyValidations {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isEmailValid(value)) {
      return 'Please enter a valid email';
    }
    return '';
  }

  static bool _isEmailValid(String value) {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/=?^_`{|}~]+@[a-zA-z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value);
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return '';
  }

  static String? validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your phone number';
    }
    return '';
  }

  static String? validateDevicePin(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your device PIN';
    }
    return '';
  }

  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter your name';
    }
    return '';
  }
}
