import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ContainerAdmin extends StatelessWidget {
  const ContainerAdmin({
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
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: TColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        )),
      ),
    );
  }
}
