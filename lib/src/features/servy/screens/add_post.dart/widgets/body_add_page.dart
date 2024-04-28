import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/servy/controller/add_page_controller.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class BodyAddPage extends StatelessWidget {
  const BodyAddPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddPageController controller = Get.put(AddPageController());

    return Form(
      key: controller.addPostFormKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) =>
                TValidator.volidateEmptyText('titleServise'.tr, value),
            controller: controller.title,
            decoration: InputDecoration(
              labelText: 'titleServise'.tr,
              prefixIcon: const Icon(Iconsax.text_block),
              prefixIconColor: TColors.primaryColor,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          TextFormField(
            minLines: 1,
            maxLines: 10,
            validator: (value) =>
                TValidator.volidateEmptyText('descriptionService'.tr, value),
            controller: controller.descreption,
            decoration: InputDecoration(
              labelText: 'descriptionService'.tr,
              prefixIcon: const Icon(Iconsax.text_block),
              prefixIconColor: TColors.primaryColor,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          TextFormField(
            validator: (value) =>
                TValidator.volidateEmptyText('priceFrom'.tr, value),
            controller: controller.priceFrom,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'priceFrom'.tr,
              prefixIcon: const Icon(Iconsax.dollar_square),
              prefixIconColor: TColors.primaryColor,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          Obx(() => Row(
                children: [
                  Checkbox(
                    value: controller.isChecked.value,
                    onChanged: (newValue) {
                      controller.isChecked.value = newValue!;
                    },
                  ),
                  Expanded(
                    child: Text(
                      'activateServiceOption'.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )),
          const SizedBox(height: TSizes.spaceBtwInputField),
          Obx(() => TextFormField(
                enabled: controller.isChecked.value,
                validator: (value) {
                  if (controller.isChecked.value) {
                    return TValidator.volidateEmptyText(
                        'correspondingService'.tr, value);
                  } else {
                    return null;
                  }
                },
                controller: controller.corssPodingService,
                decoration: InputDecoration(
                  labelText: 'correspondingService'.tr,
                  prefixIcon: const Icon(Iconsax.text_block),
                  prefixIconColor: TColors.primaryColor,
                ),
              )),
          const SizedBox(height: 16.0),
          Obx(() => TextFormField(
                enabled: controller.isChecked.value,
                validator: (value) {
                  if (controller.isChecked.value) {
                    return TValidator.volidateEmptyText(
                        'descriptioncorrespondingService'.tr, value);
                  } else {
                    return null;
                  }
                },
                controller: controller.descrCorssPodingService,
                decoration: InputDecoration(
                  labelText: 'descriptioncorrespondingService'.tr,
                  prefixIcon: const Icon(Iconsax.text_block),
                  prefixIconColor: TColors.primaryColor,
                ),
              )),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.addPost();
              },
              child: Text('publish'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
