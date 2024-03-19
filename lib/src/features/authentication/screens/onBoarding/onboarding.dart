import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/device/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
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
          Positioned(
              right: TSizes.defaultSpace,
              bottom: TDeviceUtils.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Iconsax.arrow_right3),
              ))
        ],
      ),
    );
  }
}
