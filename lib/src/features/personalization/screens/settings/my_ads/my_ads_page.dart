import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/servy/controller/add_service_page_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());
    UserController userController =
        Get.find<UserController>(); // Get the user controller

    return Scaffold(
      appBar: const TAppBar(
        title: Text('My Ads'),
        showBackArrow: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Services').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<ServiceModel> allPosts = snapshot.data!.docs
              .map((doc) => ServiceModel.fromSnapshot(doc))
              .toList();
          List<ServiceModel> currentUserPosts = allPosts
              .where((post) =>
                  post.ownerId == userController.user.value.id &&
                  post.status == 'accepted')
              .toList();
          controller.updatePosts(
              currentUserPosts); // Update the posts in the controller
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Obx(
                () => Column(
                  children: [
                    for (var post in controller.posts)
                      ServiceCardAbstract(
                        showHeartIcon: false,
                        title: post.title,
                        desc: post.descreption,
                        priceFromDescount: post.priceFromDescount,
                        price: post.priceFrom,
                        imageUrl: post.imageService,
                        isLoadingImage: false, // عرض الصورة المحملة
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
