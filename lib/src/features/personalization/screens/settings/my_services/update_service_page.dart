// ignore_for_file: file_names

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appTextFeild/app_text_feild.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class UpdateServicePage extends StatelessWidget {
  const UpdateServicePage({
    super.key,
    required this.serviceID,
    required this.service,
  });
  final String serviceID;
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());
    controller.isChecked2.value = service.hasDiscount;

    return Scaffold(
      appBar: TAppBar(
        title: Text('updateService'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.addPostFormKey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: GetBuilder<ServiceController>(
                    builder: (controller) {
                      return Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          image: controller.imageFile != null
                              ? DecorationImage(
                                  image: FileImage(controller.imageFile!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.imageFile == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.image_outlined,
                                    size: 150,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'addImageService'.tr,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            : null,
                      );
                    },
                  ),
                ),
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
                ),
                Row(
                  children: [
                    Text('informationsService'.tr),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
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
                  controller: controller.descreption,
                  decoration: InputDecoration(
                    labelText: 'descriptionService'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
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
                            controller.updateCrossServiceStatus(
                                service.serviceID, newValue ?? false);
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
                            controller.toggleDiscount(newValue ?? false);
                            controller.updateDiscountStatus(
                                service.serviceID, newValue ?? false);
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
                      ServiceModel updatedService = ServiceModel(
                        serviceID: service.serviceID,
                        title: controller.title.text.isEmpty
                            ? service.title
                            : controller.title.text,
                        descreption: controller.descreption.text.isEmpty
                            ? service.descreption
                            : controller.descreption.text,
                        imageService: controller.imageUrl != null
                            ? controller.imageUrl!
                            : service.imageService,
                        priceFrom: controller.priceFrom.text.isEmpty
                            ? service.priceFrom
                            : controller.priceFrom.text,
                        corssPodingService:
                            controller.corssPodingService.text.isEmpty
                                ? service.corssPodingService
                                : controller.corssPodingService.text,
                        descrCorssPodingService:
                            controller.descrCorssPodingService.text.isEmpty
                                ? service.descrCorssPodingService
                                : controller.descrCorssPodingService.text,
                        ownerId: service.ownerId,
                        priceFromDescount:
                            controller.priceFromDescount.text.isEmpty
                                ? service.priceFromDescount
                                : controller.priceFromDescount.text,
                        status: service.status,
                        categoris: controller.categories.text.isEmpty
                            ? service.categoris
                            : controller.categories.text,
                        hasDiscount: service.hasDiscount,
                        hasCorresService: service.hasCorresService,
                      );

                      controller.updateServiceData(updatedService);
                    },
                    child: Text('update'.tr),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
