import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_next_button.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: 'tOnBoardingTitle1'.tr,
                subTitle: 'tOnBoardingSubTitle1'.tr,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: 'tOnBoardingTitle2'.tr,
                subTitle: 'tOnBoardingSubTitle2'.tr,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: 'tOnBoardingTitle3'.tr,
                subTitle: 'tOnBoardingSubTitle3'.tr,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
