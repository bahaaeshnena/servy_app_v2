import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/widgets/user_review_card.dart';
import 'package:servy_app/src/features/servy/models/comments_model.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class SeeAllComments extends StatelessWidget {
  const SeeAllComments({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('All Comments & Rate'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('comments')
                    .where('userID', isEqualTo: service.ownerId!)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Text('No comments available');
                  } else {
                    final comments = snapshot.data!.docs
                        .map((doc) => CommentsModel.fromSnapshot(doc))
                        .toList();

                    return Column(
                      children: comments.map((comment) {
                        return UserReviewCard(
                          comment: comment.comment,
                          date: comment.date != null
                              ? '${comment.date!.day} ${_getMonthName(comment.date!.month)}, ${comment.date!.year}'
                              : 'No date',
                          rating: comment.ratingProfile,
                          userEvalution: comment.userEvaluation,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthNames[month - 1];
  }
}
