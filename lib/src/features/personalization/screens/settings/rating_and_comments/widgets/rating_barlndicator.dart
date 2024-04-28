import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class TRatingBarlndicator extends StatelessWidget {
  const TRatingBarlndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: const Color.fromARGB(255, 210, 203, 203),
      itemBuilder: (_, __) => const Icon(
        Icons.star,
        color: TColors.primaryColor,
      ),
    );
  }
}
