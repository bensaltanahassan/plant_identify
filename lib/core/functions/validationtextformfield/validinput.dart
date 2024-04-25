import 'package:get/get.dart';

class AppValidation {
  static String? validInput({
    required String val,
    int? min,
    int? max,
    String? type,
    bool? upperCase,
    bool? lowerCase,
    bool? specialChar,
  }) {
    if (val.isEmpty) {
      return "value can't be empty";
    }

    if (type == "name") {
      if (!GetUtils.isUsername(val)) {
        return "not valid";
      }
    }

    if (type == "email") {
      if (!GetUtils.isEmail(val)) {
        return "not valid email";
      }
    }
    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "not valid phone number";
      }
    }
    if (type == "double") {
      if (!GetUtils.isNum(val)) {
        return "not valid double";
      }
    }
    if (type == "password") {
      if (upperCase == true && !containsUppercase(val)) {
        return "password must contain at least one uppercase letter";
      }
      if (lowerCase == true && !containsLowercase(val)) {
        return "password must contain at least one lowercase letter";
      }
      if (specialChar == true && !containsSpecialChar(val)) {
        return "password must contain at least one special character";
      }
    }

    if (min != null && val.length < min) {
      return "value can't be less than $min";
    }
    if (max != null && val.length > max) {
      return "value can't be less than $max";
    }
    return null;
  }

  static bool containsUppercase(String s) {
    return s.contains(RegExp(r'[A-Z]'));
  }

  static bool containsLowercase(String s) {
    return s.contains(RegExp(r'[a-z]'));
  }

  static bool containsSpecialChar(String s) {
    return s.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
