import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:servy_app/main.dart';

class MyLocalController extends GetxController {
  Locale intialling = sharpref!.getString("lang") == null
      ? Get.deviceLocale!
      : Locale(sharpref!.getString("lang")!);

  void changeLanguage(String codeLnguage) {
    Locale locale = Locale(codeLnguage);
    sharpref!.setString("lang", codeLnguage);
    Get.updateLocale(locale);
  }
}
