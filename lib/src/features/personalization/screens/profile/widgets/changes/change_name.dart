import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/update_name_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'changeName'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'titleChangeName'.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.volidateEmptyText('firstName'.tr, value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: 'firstName'.tr,
                        prefix: const Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputField),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.volidateEmptyText('lastName'.tr, value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: 'lastName'.tr,
                        prefix: const Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserNames(),
                  // onPressed: () => controller.updateUserName(),
                  child: Text("save".tr),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
