import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/widgets_login_signup/divider.dart';
import 'package:servy_app/src/common/widgets/widgets_login_signup/social_button.dart';
import 'package:servy_app/src/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('signUpTitle'.tr,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDivider(dividerText: 'orSignUpWith'.tr.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
