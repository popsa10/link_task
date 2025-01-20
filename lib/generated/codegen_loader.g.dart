// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "login": "تسجيل الدخول",
  "register": "التسجيل",
  "phoneNumber": "رقم الهاتف",
  "verificationCode": "رمز التحقق",
  "typeVerificationCodeThatSentTo": "اكتب رمز التحقق الذي تم إرساله إلى",
  "edit": "تعديل",
  "didNotGetCode": "لم تستلم الرمز؟",
  "verifyNow": "تحقق الآن",
  "resend": "إعادة إرسال",
  "fullName": "الاسم الكامل",
  "enterYourFullName": "أدخل اسمك الكامل",
  "email": "البريد الإلكتروني",
  "optional": "اختياري",
  "enterYourEmail": "أدخل بريدك الإلكتروني",
  "selectGender": "حدد الجنس",
  "male": "ذكر",
  "female": "أنثى",
  "city": "المدينة",
  "selectYourCity": "حدد مدينتك",
  "whenRegisterYourAccountYouAgreeWith": "عند تسجيل حسابك، أنت توافق على",
  "termsAndConditions": "الشروط والأحكام",
  "barber": "حلاق",
  "barberSalons": "صالونات الحلاقة",
  "km": "كم",
  "language": "اللغة",
  "theme": "السمة",
  "logout": "تسجيل الخروج"
};
static const Map<String,dynamic> en = {
  "login": "Login",
  "register": "Register",
  "phoneNumber": "Phone Number",
  "verificationCode": "Verification Code",
  "typeVerificationCodeThatSentTo": "Type verification code that sent to",
  "edit": "Edit",
  "didNotGetCode": "Didn't get the code?",
  "verifyNow": "Verify Now",
  "resend": "Resend",
  "fullName": "Full Name",
  "enterYourFullName": "Enter Your Full Name",
  "email": "Email",
  "optional": "Optional",
  "enterYourEmail": "Enter Your Email",
  "selectGender": "Select Gender",
  "male": "Male",
  "female": "Female",
  "city": "City",
  "selectYourCity": "Select Your City",
  "whenRegisterYourAccountYouAgreeWith": "When Register Your Account You Agree With",
  "termsAndConditions": "Terms & Conditions",
  "barber": "Barber",
  "barberSalons": "Barber Salons",
  "km": "Km",
  "language": "Language",
  "theme": "Theme",
  "logout": "Logout"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
