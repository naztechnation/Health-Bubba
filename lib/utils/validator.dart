class Validator {
  static String? validate(String? value, String name) {
    if (value == null || value.isEmpty) {
      return '$name Required.';
    } else {
      return null;
    }
  }

  static String? validateEmail(String value,  String name) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return '$name Required.';
    }
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email.';
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value, [String? countryCode]) {
  if (value == null || value.trim().isEmpty) {
    return 'Required.';
  }

 
  String digitsOnly = value.replaceAll(RegExp(r'\D'), '');

   
  if (digitsOnly.length < 10) {
    return 'Phone number must be at least 10 digits.';
  }

  if (countryCode != null && countryCode.isEmpty) {
    return 'Country code is required.';
  }

  return null;
}


  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Required.';
    }
    if (password.length < 6) {
      return 'Password too short.';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase.';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase.';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit.';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    } else {
      return null;
    }
  }
}
