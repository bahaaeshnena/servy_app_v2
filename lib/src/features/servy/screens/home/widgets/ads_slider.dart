import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:servy_app/src/common/widgets/images/rounded_image.dart';
import 'package:servy_app/src/features/servy/controller/home_controller.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class AdsSlider extends StatelessWidget {
  const AdsSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: ((index, _) =>
                controller.updatePageIndicator(index)),
            viewportFraction: 1,
          ),
          items: banners
              .map(
                (url) => TRoundedImage(
                  imageUrl: url,
                  width: 340,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.CarousalCurrentIndex.value == i
                              ? TColors.primaryColor
                              : TColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}
