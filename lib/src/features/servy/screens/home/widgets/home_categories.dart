import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/image_text_widgets/vertical_image_text.dart';
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
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.digitalMarketing,
            title: 'digitalMarketing'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.design,
            title: 'design'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.video,
            title: 'videoEditing'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.audios,
            title: 'audiosEditing'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.writing,
            title: 'writing'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.translation,
            title: 'translation'.tr,
            onTap: () {},
          ),
          TVerticalImageText(
            image: TImages.engineeringAndArchitecture,
            title: 'engineeringArchitecture'.tr,
            onTap: () {},
          ),
        ],
      ),
      // child: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: 6,
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (_, index) {
      //     return SizedBox(
      //       height: 80,
      //       child: TVerticalImageText(
      //         image: image,
      //         title: title,
      //         onTap: onPressed,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
