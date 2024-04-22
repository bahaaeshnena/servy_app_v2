import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/update_countery_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class ChangeCountry extends StatelessWidget {
  const ChangeCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((UpdateCountryController()));

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'changeCountry'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'titleChangeCountry'.tr,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updateCountryFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.volidateEmptyText('country'.tr, value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: 'country'.tr,
                      prefix: const Icon(Iconsax.flag),
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
                onPressed: () => controller.updateCountry(),
                child: Text("save".tr),
              ),
            )
          ],
        ),
      ),
    );
  }
}
