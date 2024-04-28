import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/home_card.dart';
import 'package:servy_app/src/features/servy/controller/add_page_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddPageController controller = Get.put(AddPageController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('My Ads'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => Column(
                  children: [
                    for (var post in controller.posts)
                      HomeCard(
                        title: post.title.toString(),
                        desc: post.descreption.toString(),
                        price: post.priceFrom.toString(),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
