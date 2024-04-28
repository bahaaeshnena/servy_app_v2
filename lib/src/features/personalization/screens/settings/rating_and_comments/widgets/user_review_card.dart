import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/rating_barlndicator.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.image,
    required this.userName,
    required this.comment,
    required this.date,
    required this.rating,
  });

  final String image;
  final String userName;
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
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(width: 10),
                Text(
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
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
        // /// company Review
        // Container(
        //   decoration: const BoxDecoration(
        //     color: Color.fromARGB(255, 210, 203, 203),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(20),
        //     ),
        //   ),
        //   child: const Padding(
        //     padding: EdgeInsets.all(20.0),
        //     child: Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               'Bahaa',
        //               style: TextStyle(fontWeight: FontWeight.bold),
        //             ),
        //             Text(
        //               '02 Nov, 2024',
        //               style: TextStyle(fontWeight: FontWeight.bold),
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 10),
        //         ReadMoreText(
        //           'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
        //           trimLines: 2,
        //           trimMode: TrimMode.Line,
        //           trimExpandedText: ' show less',
        //           trimCollapsedText: ' show more',
        //           moreStyle: TextStyle(
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //               color: TColors.primaryColor),
        //           lessStyle: TextStyle(
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //               color: TColors.primaryColor),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 30),
      ],
    );
  }
}
