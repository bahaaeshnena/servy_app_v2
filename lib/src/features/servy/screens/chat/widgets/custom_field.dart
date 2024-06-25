import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
          TValidator.volidateEmptyText('personEmail'.tr, value),
      decoration: InputDecoration(
        labelText: 'personEmail'.tr,
        prefixIcon: const Icon(Iconsax.search_normal_1),
        prefixIconColor: TColors.primaryColor,
      ),
    );
  }
}
