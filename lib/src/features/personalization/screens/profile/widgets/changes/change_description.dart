import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/update_gender_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class ChangeDesc extends StatelessWidget {
  const ChangeDesc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'changeDescription'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'titleChangeDescription'.tr,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updateDescriptionFormKey,
              child: Column(
                children: [
                  TextFormField(
                    minLines: 1,
                    maxLines: 20,
                    controller: controller.description,
                    validator: (value) =>
                        TValidator.volidateEmptyText('description'.tr, value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: 'description'.tr,
                      prefix: const Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputField),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateGender(),
                child: Text("save".tr),
              ),
            )
          ],
        ),
      ),
    );
  }
}
