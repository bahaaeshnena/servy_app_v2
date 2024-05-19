import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/user_review_card.dart';
import 'package:servy_app/src/features/servy/models/comments_model.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/add_comments.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/see_all_comments.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/services_user.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/user_profile_service_card.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class ProfileUserPublish extends StatelessWidget {
  const ProfileUserPublish({
    super.key,
    required this.service,
  });
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    // UserController userController = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TUserProfilsServiceCard(
              icon: Iconsax.message,
              onPressed: () async {
                await FireData().createRoom(service.ownerEmail!);
                TLoaders.successSnackBar(
                    title: 'Done',
                    message:
                        'A chat room has been created between you and the user on the chat page');
              },
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
                          'userInformation'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: UserController.instance
                          .getFieldValue(service.ownerId!, 'description'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const TShimmerEffect(
                              width: double.infinity, height: 15);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SizedBox(
                            child: AutoSizeText(
                              snapshot.data.toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
                              minFontSize: 12,
                              maxFontSize: 24,
                              maxLines: 4,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.work_outline,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Add other widgets here
                            FutureBuilder(
                              future: UserController.instance
                                  .getFieldValue(service.ownerId!, 'Skills'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const TShimmerEffect(
                                      width: 100, height: 15);
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'skill'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            Text(
                                              snapshot.data.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            // Add other widgets here
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        FutureBuilder(
                          future: UserController.instance
                              .getFieldValue(service.ownerId!, 'Country'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const TShimmerEffect(
                                  width: 100, height: 15);
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'from'.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                          snapshot.data.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: UserController.instance.getFieldValue(
                                  service.ownerId!, 'ratingUser'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const TShimmerEffect(
                                      width: 100, height: 15);
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'rate'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            Text(
                                              snapshot.data.toStringAsFixed(1),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'reviewAndComments'.tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => AddComment(
                                    serviceID: service,
                                  ));
                            },
                            child: Text('addComment'.tr),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => SeeAllComments(
                                    service: service,
                                  ));
                            },
                            child: Text('seeAll'.tr),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('comments')
                          .where('userID', isEqualTo: service.ownerId!)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Text('noCommentsAvailable'.tr);
                        } else {
                          final comments = snapshot.data!.docs
                              .map((doc) => CommentsModel.fromSnapshot(doc))
                              .toList();

                          return Column(
                            children: comments.take(8).map((comment) {
                              return UserReviewCard(
                                comment: comment.comment,
                                date: comment.date != null
                                    ? '${comment.date!.day} ${_getMonthName(comment.date!.month)}, ${comment.date!.year}'
                                    : 'No date',
                                rating: comment.ratingProfile,
                                userEvalution: comment.userEvaluation,
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(
                                  () => ServicesUserPublish(service: service));
                            },
                            child: Text('viewMyWorks'.tr)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthNames[month - 1];
  }
}
