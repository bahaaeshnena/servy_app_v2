import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ContainerServicesDepartment extends StatelessWidget {
  const ContainerServicesDepartment({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: TColors.primaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
