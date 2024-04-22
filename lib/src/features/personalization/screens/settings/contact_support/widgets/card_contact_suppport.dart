import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardContactSupport extends StatelessWidget {
  const CardContactSupport({
    super.key,
    required this.color,
    required this.text,
    required this.image,
    required this.onTap,
  });
  final Color color;
  final String text;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Row(
            children: [
              LottieBuilder.asset(image),
              const SizedBox(width: 30),
              Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
