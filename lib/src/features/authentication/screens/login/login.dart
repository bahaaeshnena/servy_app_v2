import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/styles/spacing_styles.dart';
import 'package:servy_app/src/common/widgets/widgets_login_signup/divider.dart';
import 'package:servy_app/src/common/widgets/widgets_login_signup/social_button.dart';
import 'package:servy_app/src/features/authentication/screens/login/widgets/login_form.dart';
import 'package:servy_app/src/features/authentication/screens/login/widgets/login_header.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TspacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            const LoginHeader(),
            const LoginForm(),
            TFormDivider(dividerText: 'orSignInWith'.tr),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSocialButton()
          ],
        ),
      ),
    );
  }
}
