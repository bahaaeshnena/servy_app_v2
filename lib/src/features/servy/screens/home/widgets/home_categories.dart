import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/audio_editing.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/design.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/digital_markiting.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/engineering_and_arthitecture.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/other.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/programming.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/translation.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/video_editing.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/writing.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TVerticalImageText(
            image: TImages.programming,
            title: 'programming'.tr,
            onTap: () => Get.to(() => const CategoryProgramming()),
          ),
          TVerticalImageText(
            image: TImages.digitalMarketing,
            title: 'digitalMarketing'.tr,
            onTap: () => Get.to(() => const CategoryDigitalMarkiting()),
          ),
          TVerticalImageText(
            image: TImages.design,
            title: 'design'.tr,
            onTap: () => Get.to(() => const CategoryDesign()),
          ),
          TVerticalImageText(
            image: TImages.video,
            title: 'videoEditing'.tr,
            onTap: () => Get.to(() => const CategoryVideoEditing()),
          ),
          TVerticalImageText(
            image: TImages.audios,
            title: 'audiosEditing'.tr,
            onTap: () => Get.to(() => const CategoryAudiosEditing()),
          ),
          TVerticalImageText(
            image: TImages.writing,
            title: 'writing'.tr,
            onTap: () => Get.to(() => const CategoryWriting()),
          ),
          TVerticalImageText(
            image: TImages.translation,
            title: 'translation'.tr,
            onTap: () => Get.to(() => const CategoryTransaltion()),
          ),
          TVerticalImageText(
            image: TImages.engineeringAndArchitecture,
            title: 'engineeringArchitecture'.tr,
            onTap: () =>
                Get.to(() => const CategoryEngineeringAndArchetecture()),
          ),
          TVerticalImageText(
            image: TImages.other,
            title: 'other'.tr,
            onTap: () => Get.to(() => const CategoryOther()),
          ),
        ],
      ),
    );
  }
}
