import 'package:flutter/widgets.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/rating_progress_indicator.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: TextStyle(fontSize: 55),
            )),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgresslndicator(text: '5', value: 1.0),
              TRatingProgresslndicator(text: '4', value: 0.8),
              TRatingProgresslndicator(text: '3', value: 0.6),
              TRatingProgresslndicator(text: '2', value: 0.4),
              TRatingProgresslndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
