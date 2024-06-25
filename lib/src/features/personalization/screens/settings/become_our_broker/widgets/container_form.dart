import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class ContainerForm extends StatelessWidget {
  const ContainerForm({super.key, required this.onTap, required this.title});
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap function passed from the constructor
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: TColors.accent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              TImages.imageForm,
              width: 150,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
