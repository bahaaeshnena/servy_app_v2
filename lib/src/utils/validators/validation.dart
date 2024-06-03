import 'package:get/get.dart';

class TValidator {
  static String? volidateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      // ignore: prefer_adjacent_string_concatenation, unnecessary_brace_in_string_interps
      return '${fieldName}' + ' ' + 'isRequired'.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'emailIsRequired'.tr;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalidEmailAddress'.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordIsRequired'.tr;
    }

    if (value.length < 6) {
      return 'errorPassword'.tr;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'errorPassword2'.tr;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'errorPassword3'.tr;
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'errorPassword4'.tr;
    }
    return null;
  }

  static String? validatPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneIsRequired'.tr;
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'errorPhone'.tr;
    }
    return null;
  }
}
