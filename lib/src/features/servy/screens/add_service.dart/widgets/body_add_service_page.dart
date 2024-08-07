import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appTextFeild/app_text_feild.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/screens/add_service.dart/widgets/container_image_service.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class BodyAddServicePage extends StatelessWidget {
  const BodyAddServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());

    return Form(
      key: controller.addPostFormKey,
      child: Column(
        children: [
          const ContainerImageService(),
          const SizedBox(height: TSizes.spaceBtwSections),
          AppTextField(
            categories: [
              SelectedListItem(name: TText.programming),
              SelectedListItem(name: TText.digitalMarketing),
              SelectedListItem(name: TText.design),
              SelectedListItem(name: TText.videoEditing),
              SelectedListItem(name: TText.audiosEditing),
              SelectedListItem(name: TText.writing),
              SelectedListItem(name: TText.translation),
              SelectedListItem(
                name: TText.engineeringArchitecture,
              ),
              SelectedListItem(name: TText.other),
            ],
            textEditingController: controller.categories,
            title: 'selectCategories'.tr,
            hint: 'categories'.tr,
            isCategorySelected: true,
            validate: (value) =>
                TValidator.volidateEmptyText('selectCategories'.tr, value),
          ),
          Row(
            children: [
              Text('informationsService'.tr),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            minLines: 1,
            maxLines: 20,
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
            maxLines: 20,
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

          //! active Service Option

          Obx(() => Row(
                children: [
                  Checkbox(
                    value: controller.isChecked.value,
                    onChanged: (newValue) {
                      controller.toggleCrossServices(newValue ?? false);
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
                minLines: 1,
                maxLines: 20,
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
                minLines: 1,
                maxLines: 20,
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
                      controller.toggleDiscount(newValue ?? false);
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
                keyboardType: TextInputType.number,
                enabled: controller.isChecked2.value,
                validator: (value) {
                  if (controller.isChecked2.value) {
                    return TValidator.volidateEmptyText(
                        'priceFromDiscount'.tr, value);
                  } else {
                    return null;
                  }
                },
                controller: controller.priceFromDescount,
                decoration: InputDecoration(
                  labelText: 'priceFromDiscount'.tr,
                  prefixIcon: const Icon(Iconsax.discount_shape),
                  prefixIconColor: TColors.primaryColor,
                ),
              )),
          const SizedBox(height: TSizes.spaceBtwInputField),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.addService();
              },
              child: Text('publish'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
