import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/card/suggesion_list.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/ads_slider.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/home_appbar.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/home_categories.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Searchbar
                  TSearchContainer(text: 'searchContainer'.tr),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(
                        left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                    child: Expanded(
                      child: Column(
                        children: [
                          //Heading
                          TSectionHeading(
                              title: "popularCategories".tr,
                              showActionButton: false),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          //Categories
                          const THomeCategories()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            //Body
            const Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  AdsSlider(
                    banners: [
                      TImages.banner1,
                      TImages.banner2,
                      TImages.banner3,
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SuggestionList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
