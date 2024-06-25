import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ContainerDetailes extends StatelessWidget {
  const ContainerDetailes({
    super.key,
    required this.text,
    required this.title,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 60),
            decoration: BoxDecoration(
              color: TColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Divider(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
