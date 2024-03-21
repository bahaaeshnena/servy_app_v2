import 'package:flutter/material.dart';
import 'package:servy_app/src/common/styles/spacing_styles.dart';
import 'package:servy_app/src/common/widgets_login_signup/login_divider.dart';
import 'package:servy_app/src/common/widgets_login_signup/social_button.dart';
import 'package:servy_app/src/features/authentication/screens/login/widgets/login_form.dart';
import 'package:servy_app/src/features/authentication/screens/login/widgets/login_header.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: TspacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            LoginHeader(),
            LoginForm(),
            Logindivider(dividerText: TText.orSignInWith),
            SizedBox(height: TSizes.spaceBtwSections),
            SocialButton()
          ],
        ),
      ),
    );
  }
}
