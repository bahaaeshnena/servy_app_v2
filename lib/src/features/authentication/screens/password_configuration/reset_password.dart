import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/controllers/forget_password_controller/forget_password_controller.dart';
import 'package:servy_app/src/features/authentication/screens/login/login.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///image
            Image(
              image: const AssetImage(TImages.deliveredEmailIllistration),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Title & SubTitle

            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TText.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TText.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                child: const Text(TText.done),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => ForgetPasswordController.instance
                    .resendPasswordResetEmail(email),
                child: const Text(TText.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
