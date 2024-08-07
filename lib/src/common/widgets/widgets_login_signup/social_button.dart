import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/controllers/login/login_controller.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              image: AssetImage(TImages.google),
              width: TSizes.iconLg,
              height: TSizes.iconLg,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(color: TColors.grey),
        //       borderRadius: BorderRadius.circular(100)),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Image(
        //       image: AssetImage(TImages.facebook),
        //       width: TSizes.iconLg,
        //       height: TSizes.iconLg,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
