import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding.dart';
import 'package:servy_app/src/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: const OnBoardingScreen(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme);
  }
}
