import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:servy_app/src/utils/network/loaders.dart';

class CommentController extends GetxController {
  final _db = FirebaseFirestore.instance;
  TextEditingController ratingController = TextEditingController();
  RxDouble rating = 0.0.obs; // Add RxDouble for rating
  //!---------------------Rating----------------------

  void updateRating(String value) {
    final int? ratingValue = int.tryParse(value);
    if (ratingValue != null && ratingValue >= 1 && ratingValue <= 5) {
      rating.value = ratingValue.toDouble();
    } else {
      rating.value = 0.0; // Reset rating if invalid value
    }
  }

  Future<void> updateServiceRating(String userID, double newRating) async {
    final serviceRef = _db.collection('Users').doc(userID);

    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(serviceRef);
      if (!snapshot.exists) {
        throw Exception("Service does not exist!");
      }

      final serviceData = snapshot.data() as Map<String, dynamic>;
      final numberOfRatings = (serviceData['numberOfRatings'] ?? 0) as int;
      final totalRating = (serviceData['totalRating'] ?? 0.0) as double;

      final newNumberOfRatings = numberOfRatings + 1;
      final newTotalRating = totalRating + newRating;
      final newAverageRating = newTotalRating / newNumberOfRatings;

      transaction.update(serviceRef, {
        'numberOfRatings': newNumberOfRatings,
        'totalRating': newTotalRating,
        'ratingService': newAverageRating,
      });
    });
  }

  Future<void> saveRatingToFirestore(String serviceID) async {
    try {
      if (rating.value >= 1 && rating.value <= 5) {
        await updateServiceRating(serviceID, rating.value);
        TLoaders.successSnackBar(
          title: 'Success',
          message: 'Rating updated successfully',
        );
      } else {
        TLoaders.errorSnackBar(
          title: 'Error',
          message: 'Rating must be between 1 and 5',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Failed to update rating: $e',
      );
    }
  }

  //! Add Comments and rate

  //!Get Comments and rate
}
