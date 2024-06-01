import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/controllers/brokers_controller.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/widget/container_image_brokers.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class AddingBrokers extends StatelessWidget {
  const AddingBrokers({super.key});

  @override
  Widget build(BuildContext context) {
    BrokersController controller = Get.put(BrokersController());
    return Scaffold(
      appBar: TAppBar(
        title: Text('addingBrokers'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addBrokerFormKey,
            child: Column(
              children: [
                const ContainerImageBroker(),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    Text('addingBrokersSubTitle'.tr),
                    const SizedBox(height: 8),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('userName'.tr, value),
                  controller: controller.username,
                  decoration: InputDecoration(
                    labelText: 'userName'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      TValidator.volidateEmptyText('age'.tr, value),
                  controller: controller.age,
                  decoration: InputDecoration(
                    labelText: 'age'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  validator: (value) =>
                      TValidator.volidateEmptyText('country'.tr, value),
                  controller: controller.country,
                  decoration: InputDecoration(
                    labelText: 'country'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('function'.tr, value),
                  controller: controller.function,
                  decoration: InputDecoration(
                    labelText: 'function'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('description'.tr, value),
                  controller: controller.desc,
                  decoration: InputDecoration(
                    labelText: 'description'.tr,
                    prefixIcon: const Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  validator: (value) => TValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: InputDecoration(
                    labelText: 'email'.tr,
                    prefixIcon: const Icon(Icons.email_outlined),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addBroker();
                    },
                    child: Text('add'.tr),
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
