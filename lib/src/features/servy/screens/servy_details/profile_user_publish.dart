import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/user_review_card.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/services_user.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/user_profile_service_card.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class ProfileUserPublish extends StatelessWidget {
  const ProfileUserPublish({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TUserProfilsServiceCard(
              icon: Iconsax.message,
              onPressed: () {},
              service: service,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'User information',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: AutoSizeText(
                        service.descUser!,
                        style: Theme.of(context).textTheme.headlineSmall,
                        minFontSize: 12,
                        maxFontSize: 24,
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.work_outline,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skills',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              service.skillsUser!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              service.user.country,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rate',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '4.2',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'reviews',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    UserReviewCard(
                      image: TImages.userAhmed,
                      userName: 'Ahmed adli',
                      comment: 'A creative and hardworking person in his work',
                      date: '01 Nov, 2024',
                      rating: 3,
                    ),
                    UserReviewCard(
                      date: '11 Dec, 2024',
                      rating: 5,
                      image: TImages.userAbood,
                      userName: 'Abood bni Salamah',
                      comment: 'He does great work and delivers on time',
                    ),
                    UserReviewCard(
                      date: '05 Jan, 2024',
                      rating: 3.5,
                      image: TImages.userBassem,
                      userName: 'Mohammed Bassem',
                      comment:
                          'He is an excellent person to deal with and trustworthy',
                    ),
                    UserReviewCard(
                      date: '20 Feb, 2024',
                      rating: 4.5,
                      image: TImages.userRaed,
                      userName: 'Mohammed Raed',
                      comment: 'Excellent and precise work',
                    ),
                    UserReviewCard(
                      date: '05 Nov, 2024',
                      rating: 4.2,
                      image: TImages.userSammer,
                      userName: 'Sammer Al Hajeid',
                      comment: 'Creative in his work',
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(
                                  () => ServicesUserPublish(service: service));
                            },
                            child: const Text('View my work')))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
