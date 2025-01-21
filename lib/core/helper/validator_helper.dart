

import 'package:easy_localization/easy_localization.dart';
import 'package:link_task/generated/locale_keys.g.dart';

class Validator {
  Validator._();
  static String? validateName(String? value) {
    if (value!.isEmpty || value.length < 2) {
      return LocaleKeys.enterYourFullName.tr();
    }
    return null;
  }



  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.pleaseEnterYourPhoneNumber.tr();
    } else if (!value.startsWith("05")) {
      return LocaleKeys.phoneNumberMustStartWith5.tr();
    } else if (value.length < 10) {
      return LocaleKeys.pleaseEnterValidPhoneNumber.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
     if (!regExp.hasMatch(value!)) { 
      return LocaleKeys.pleaseEnterValidEmail.tr();
    } else {
      return null;
    }
  }

  static String? validateVerificationCode(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.enterYourFullName.tr();
    }
    return null;
  }
}
