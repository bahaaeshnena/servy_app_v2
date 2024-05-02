import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/controller/add_service_page_controller.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => Column(
                  children: [
                    for (var post in controller.posts)
                      // عرض المشاركة فقط إذا كانت حالتها "تم قبولها"
                      if (post.status == 'accepted')
                        ServiceCardAbstract(
                          showHeartIcon: false,
                          title: post.title.toString(),
                          desc: post.descreption.toString(),
                          priceFromDescount: post.priceFromDescount.toString(),
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
