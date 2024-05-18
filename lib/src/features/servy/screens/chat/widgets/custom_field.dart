import 'package:flutter/material.dart';
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
      validator: (value) => TValidator.volidateEmptyText('Person Name', value),
      decoration: const InputDecoration(
        labelText: 'Person Name',
        prefixIcon: Icon(Iconsax.search_normal_1),
        prefixIconColor: TColors.primaryColor,
      ),
    );
  }
}
