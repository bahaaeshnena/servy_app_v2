import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              // value: true,
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          // استخدام Expanded للتمدد بنسبة
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    // ignore: unnecessary_string_interpolations
                    text: '${'iAgreeTo'.tr}',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  // ignore: unnecessary_string_interpolations
                  text: '${'privacyPolicy'.tr}',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? TColors.white : TColors.primaryColor),
                ),
                TextSpan(
                    // ignore: unnecessary_string_interpolations
                    text: '${'and'.tr}',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  // ignore: unnecessary_string_interpolations
                  text: '${'termsOfUse'.tr}',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? TColors.white : TColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
