import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/servy_maun_large_image.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class ServyDtailsScreen extends StatelessWidget {
  const ServyDtailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //? 1- servy main large image
            const ServyMainLargeImage(),

            //? 2-Servy Dtails
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: dark ? TColors.black : TColors.light,
                    ),
                    height: 100,
                    width: 500,
                    child: const InformationProfile(),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: dark ? TColors.black : TColors.light,
                    ),
                    height: 250,
                    width: 500,
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'web Application',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Programming websites and systems in PHP + MYSQL professionally',
                            style: TextStyle(
                              fontSize: 22,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: dark ? TColors.black : TColors.light,
                    ),
                    height: 200,
                    width: 500,
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'From : 5\$',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'The desired service : design video',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationProfile extends StatelessWidget {
  const InformationProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TCircularImage(
            image: TImages.user,
            width: 70,
            height: 70,
          ),
        ),
        const SizedBox(width: 10),
        Text('bahaa eshnena', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(width: 90),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.arrow_right_34,
          ),
        ),
      ],
    );
  }
}
