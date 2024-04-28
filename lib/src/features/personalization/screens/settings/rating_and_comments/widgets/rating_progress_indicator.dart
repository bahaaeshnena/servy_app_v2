import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class TRatingProgresslndicator extends StatelessWidget {
  const TRatingProgresslndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: 10,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: const Color.fromARGB(255, 210, 203, 203),
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(
                TColors.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
