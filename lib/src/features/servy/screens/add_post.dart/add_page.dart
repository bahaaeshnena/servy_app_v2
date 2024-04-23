import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/add_post.dart/widgets/body_add_page.dart';
import 'package:servy_app/src/features/servy/screens/add_post.dart/widgets/container_image_service.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('addService'.tr),
        actions: [LottieBuilder.asset(TImages.add)],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ContainerImageService(),
              SizedBox(height: 30),
              BodyAddPage(),
              SizedBox(height: TSizes.spaceBtwInputField),
            ],
          ),
        ),
      ),
    );
  }
}
