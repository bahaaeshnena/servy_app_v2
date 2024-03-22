import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/home_appbar.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/home_categories.dart';

import 'package:servy_app/src/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // drawer: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSearchContainer(text: "Search in Servy"),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                            title: "Popular Categories",
                            showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories()
                      ],
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
