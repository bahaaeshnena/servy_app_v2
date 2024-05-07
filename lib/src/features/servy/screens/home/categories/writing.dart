import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/widgets/display_service_categories.dart';

class CategoryWriting extends StatelessWidget {
  const CategoryWriting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('writing'.tr),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: DisplayServiceCategories(
          filter: 'writing',
        ),
      ),
    );
  }
}
