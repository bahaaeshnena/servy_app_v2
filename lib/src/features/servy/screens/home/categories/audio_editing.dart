import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/home/categories/widgets/display_service_categories.dart';

class CategoryAudiosEditing extends StatelessWidget {
  const CategoryAudiosEditing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('audiosEditing'.tr),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: DisplayServiceCategories(
          filter: 'audios editing',
        ),
      ),
    );
  }
}
