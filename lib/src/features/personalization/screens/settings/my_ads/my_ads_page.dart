import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/controller/add_service_page_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddServicePageController controller = Get.put(AddServicePageController());

    return Scaffold(
      appBar: const TAppBar(
        title: Text('My Ads'),
        showBackArrow: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<ServiceModel> posts = snapshot.data!.docs
              .map((doc) => ServiceModel.fromSnapshot(doc))
              .toList();
          controller.updatePosts(posts); // Update the posts in the controller
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Obx(
                () => Column(
                  children: [
                    for (var post in controller.posts)
                      if (post.status == 'accepted')
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
