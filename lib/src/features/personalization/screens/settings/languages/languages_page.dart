import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/languages/widgets/container_language.dart';
import 'package:servy_app/src/localization/controller/localization_controller.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controllerLanguage = Get.find();
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('changeLanguage'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'titleChangeLanguage'.tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            Text(
              'subTitleChangeLanguage'.tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ContainerLanguage(
                    title: 'Arabic',
                    image: TImages.language,
                    onTap: () {
                      controllerLanguage.changeLanguage('ar');
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ContainerLanguage(
                    title: 'English',
                    image: TImages.english,
                    onTap: () {
                      controllerLanguage.changeLanguage('en');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
