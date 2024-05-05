import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appTextFeild/app_text_feild.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/add_service.dart/widgets/body_add_service_page.dart';
import 'package:servy_app/src/features/servy/screens/add_service.dart/widgets/container_image_service.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categories = TextEditingController();

    return Scaffold(
      appBar: TAppBar(
        title: Text('addService'.tr),
        actions: [LottieBuilder.asset(TImages.add)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const ContainerImageService(),
              const SizedBox(height: TSizes.spaceBtwSections),
              AppTextField(
                  categories: [
                    SelectedListItem(name: 'programming'.tr),
                    SelectedListItem(name: 'digitalMarketing'.tr),
                    SelectedListItem(name: 'design'.tr),
                    SelectedListItem(name: 'videoEditing'.tr),
                    SelectedListItem(name: 'audiosEditing'.tr),
                    SelectedListItem(name: 'writing'.tr),
                    SelectedListItem(name: 'translation'.tr),
                    SelectedListItem(name: 'engineeringArchitecture'.tr),
                  ],
                  textEditingController: categories,
                  title: 'selectCategories'.tr,
                  hint: 'categories'.tr,
                  isCategorySelected: true),
              const BodyAddServicePage(),
              const SizedBox(height: TSizes.spaceBtwInputField),
            ],
          ),
        ),
      ),
    );
  }
}
