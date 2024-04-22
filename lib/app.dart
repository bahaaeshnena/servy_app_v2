import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/bindings/general_bindings.dart';
import 'package:servy_app/src/localization/controller/localization_controller.dart';
import 'package:servy_app/src/localization/localization.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/theme/theme.dart';
import 'package:servy_app/src/utils/theme/theme_mode_change.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return GetMaterialApp(
      home: const Scaffold(
        backgroundColor: TColors.primaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      initialBinding: GeneralBinding(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().getThemeMode(),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      locale: controller.intialling,
      translations: MyLocal(),
    );
  }
}
