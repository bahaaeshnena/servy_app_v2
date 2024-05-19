import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/update_skills.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class ChangeSkills extends StatelessWidget {
  const ChangeSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateSkillsController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'changeSkills'.tr,
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
                'titleChangeSkill'.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Form(
                key: controller.updateSkillsFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.skills,
                      validator: (value) =>
                          TValidator.volidateEmptyText('skill'.tr, value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: 'skill'.tr,
                        prefix: const Icon(Icons.work_outline),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateSkills(),
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
