import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // Login Screen
          "1.1": "تسجيل الدخول",
          "1.2": "البريد الالكتروني",
          "1.3": "كلمة المرور",
          "1.4": "مرحبا, من فضلك ادخل بريدك الالكتروني",
          "1.5": "مرحبا, من فضلك ادخل كلمة المرور",
          "1.6": "هل نسيت كلمة المرور؟",
          "1.7": "التعليم العالي في مصر",
          "1.8": "جامعة قناة السويس",
          "1.9": "جامعة حكومية مصرية",
          "1.10": "من فضلك ادخل بريدك الالكتروني",
          "1.11" : "ادخل بريد الكتروني صحيح", 
          "1.12" : "من فضلك ادخل كلمة المرور",
          "1.13" : "كلمة المرور يجب ان تكون على الاقل 6 احرف",
          "1.14" : "تم الضغط على زر تسجيل الدخول.",
          // Forgot Password Screen
          "2.1": "استعادة كلمة المرور",
          "2.2": "يرجى إدخال ايميلك الجامعي لتلقي رمز التحقق",
          "2.3": "ارسل الرمز",
          // Home Screen
          "3.1": "كلية الحاسبات والمعلومات",
        },
        "en": {
          // Login Screen
          "1.1": "Login",
          "1.2": "Email",
          "1.3": "Password",
          "1.4": "Hi, please enter your email",
          "1.5": "Hi, please enter your password",
          "1.6": "Forgot Password?",
          "1.7": "Higher Education in Egypt",
          "1.8": "Suez Canal University",
          "1.9": "An Egyptian Government University",
          "1.10": "Please enter your email",
          "1.11" : "Enter a valid email address",
          "1.12" : "Please enter your password",
          "1.13" : "Password must be at least 6 characters",
          "1.14" : "Login button pressed.",
          // Forgot Password Screen
          "2.1": "Recover your password",
          "2.2": "Please enter your university email to receive the verification code",
          "2.3": "Send code",
          // Home Screen
          "3.1": "Faculty of Computers and Information",
        },
      };
}
