import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/rating_barlndicator.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    // required this.image,
    this.userName,
    required this.comment,
    required this.date,
    required this.rating,
    required this.userEvalution,
  });

  // final String image;
  final String userEvalution;
  final String? userName;
  final String comment;
  final String date;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FutureBuilder(
                  future: UserController.instance
                      .getFieldValue(userEvalution, 'ProfilePicture'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TShimmerEffect(width: 100, height: 15);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data.toString()),
                      );
                    }
                  },
                ),
                const SizedBox(width: 10),
                FutureBuilder(
                  future: UserController.instance
                      .getFieldValue(userEvalution, 'Username'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TShimmerEffect(width: 100, height: 15);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text(
                        'Unknown User',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// Review
        Row(
          children: [
            TRatingBarlndicator(rating: rating),
            const SizedBox(width: 10),
            Text(date),
          ],
        ),
        const SizedBox(height: 10),
        ReadMoreText(
          textAlign: TextAlign.start,
          comment,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primaryColor),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primaryColor),
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
