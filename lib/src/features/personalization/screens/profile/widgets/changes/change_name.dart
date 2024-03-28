import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/update_name_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
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
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'use real name for verification. This name will appear on several pages.',
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
                        TValidator.volidateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TText.firstName,
                      prefix: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputField),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.volidateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TText.lastName,
                      prefix: Icon(Iconsax.user),
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
                child: const Text("save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
