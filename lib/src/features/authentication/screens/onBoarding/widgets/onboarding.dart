import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_next_button.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/texts.dart';

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
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TText.tOnBoardingTitle1,
                subTitle: TText.tOnBoardingTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TText.tOnBoardingTitle2,
                subTitle: TText.tOnBoardingTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TText.tOnBoardingTitle3,
                subTitle: TText.tOnBoardingTitle3,
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
