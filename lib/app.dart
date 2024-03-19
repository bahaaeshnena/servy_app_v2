import 'package:flutter/material.dart';
import 'package:servy_app/src/features/authentication/screens/onboarding.dart';
import 'package:servy_app/src/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const OnBoardingScreen(),
        debugShowCheckedModeBanner: true,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme);
  }
}
