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
      appBar: const TAppBar(
        title: Text('Adding brokers'),
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
                const Row(
                  children: [
                    Text('Enter Broker information'),
                    SizedBox(height: 8),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('User name', value),
                  controller: controller.username,
                  decoration: const InputDecoration(
                    labelText: 'User name',
                    prefixIcon: Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      TValidator.volidateEmptyText('Age', value),
                  controller: controller.age,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  validator: (value) =>
                      TValidator.volidateEmptyText('Country', value),
                  controller: controller.country,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    prefixIcon: Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('Function', value),
                  controller: controller.function,
                  decoration: const InputDecoration(
                    labelText: 'Function',
                    prefixIcon: Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  validator: (value) =>
                      TValidator.volidateEmptyText('Description', value),
                  controller: controller.desc,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Iconsax.text_block),
                    prefixIconColor: TColors.primaryColor,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  validator: (value) => TValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Iconsax.text_block),
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
                    child: const Text('Add broker'),
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
