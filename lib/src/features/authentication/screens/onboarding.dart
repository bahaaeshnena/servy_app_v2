import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/device/device_utility.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

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
          Positioned(
              top: TDeviceUtils.getAppBArHeight(),
              right: TSizes.defaultSpace,
              child: TextButton(
                onPressed: () {},
                child: const Text("Skip"),
              ))
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: 350,
            height: 550,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
