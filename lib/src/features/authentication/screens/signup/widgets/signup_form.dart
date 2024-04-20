import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:servy_app/src/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.volidateEmptyText('firstName'.tr, value),
                  decoration: InputDecoration(
                    labelText: 'firstName'.tr,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.volidateEmptyText('lastName'.tr, value),
                  controller: controller.lastName,
                  decoration: InputDecoration(
                    labelText: 'lastName'.tr,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          TextFormField(
            validator: (value) =>
                TValidator.volidateEmptyText('userName'.tr, value),
            controller: controller.userName,
            decoration: InputDecoration(
              labelText: 'userName'.tr,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: InputDecoration(
              labelText: 'email'.tr,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value) => TValidator.validatPhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: InputDecoration(
              labelText: 'phoneNumber'.tr,
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              decoration: InputDecoration(
                  labelText: 'password'.tr,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  )),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text('createAccount'.tr),
            ),
          )
        ],
      ),
    );
  }
}
