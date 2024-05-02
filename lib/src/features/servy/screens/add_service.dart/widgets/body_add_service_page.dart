import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/servy/controller/add_service_page_controller.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class BodyAddServicePage extends StatelessWidget {
  const BodyAddServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddServicePageController controller = Get.put(AddServicePageController());

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

          //! active discount price
          Obx(() => Row(
                children: [
                  Checkbox(
                    value: controller.isChecked2.value,
                    onChanged: (newValue) {
                      controller.isChecked2.value = newValue!;
                    },
                  ),
                  Expanded(
                    child: Text(
                      'activateDescounts'.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )),
          const SizedBox(height: TSizes.spaceBtwInputField),
          Obx(() => TextFormField(
                enabled: controller.isChecked2.value,
                validator: (value) {
                  if (controller.isChecked2.value) {
                    return TValidator.volidateEmptyText(
                        'priceFromDiscount'.tr, value);
                  } else {
                    return null;
                  }
                },
                controller: controller.corssPodingService,
                decoration: InputDecoration(
                  labelText: 'priceFromDiscount'.tr,
                  prefixIcon: const Icon(Iconsax.text_block),
                  prefixIconColor: TColors.primaryColor,
                ),
              )),
          const SizedBox(height: TSizes.spaceBtwInputField),

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
