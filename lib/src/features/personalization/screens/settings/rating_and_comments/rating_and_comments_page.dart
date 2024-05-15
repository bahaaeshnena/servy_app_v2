// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
// import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/overall_product_ratting.dart';
// import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/rating_barlndicator.dart';
// import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/user_review_card.dart';
// import 'package:servy_app/src/utils/constants/images.dart';

// class RatingAndCommentsPage extends StatelessWidget {
//   const RatingAndCommentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /// Appbar
//       appBar: TAppBar(
//         title: Text('titleOption2'.tr),
//         showBackArrow: true,
//       ),

//       /// Body
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("subTitleOption2".tr),
//               const SizedBox(height: 20),

//               /// Overall Product Rating
//               const TOverallProductRating(),
//               const TRatingBarlndicator(rating: 3.5),
//               const Text(
//                 "50",
//                 style: TextStyle(fontSize: 12),
//               ),
//               const SizedBox(height: 30),

//               /// User Review List
//               UserReviewCard(
//                 image: TImages.userAhmed,
//                 userName: 'Ahmed adli',
//                 comment: 'A creative and hardworking person in his work',
//                 date: '01 Nov, 2024',
//                 rating: 3,
//               ),
//               UserReviewCard(
//                 date: '11 Dec, 2024',
//                 rating: 5,
//                 image: TImages.userAbood,
//                 userName: 'Abood bni Salamah',
//                 comment: 'He does great work and delivers on time',
//               ),
//               UserReviewCard(
//                 date: '05 Jan, 2024',
//                 rating: 3.5,
//                 image: TImages.userBassem,
//                 userName: 'Mohammed Bassem',
//                 comment:
//                     'He is an excellent person to deal with and trustworthy',
//               ),
//               UserReviewCard(
//                 date: '20 Feb, 2024',
//                 rating: 4.5,
//                 image: TImages.userRaed,
//                 userName: 'Mohammed Raed',
//                 comment: 'Excellent and precise work',
//               ),
//               UserReviewCard(
//                 date: '05 Nov, 2024',
//                 rating: 4.2,
//                 image: TImages.userSammer,
//                 userName: 'Sammer Al Hajeid',
//                 comment: 'Creative in his work',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
