import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class CommentController extends GetxController {
  final _db = FirebaseFirestore.instance;
  TextEditingController ratingController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  GlobalKey<FormState> addCommentAndrateFormKey = GlobalKey<FormState>();

  RxDouble rating = 0.0.obs;
  void clearInputFields() {
    ratingController.clear();
    commentController.clear();
    update();
    // تفريغ الصورة المحددة
  }

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
        'ratingUser': newAverageRating,
      });
    });
  }

  Future<void> saveRatingToFirestore(String serviceID) async {
    try {
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.procsingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!addCommentAndrateFormKey.currentState!.validate()) {
        return;
      }
      if (rating.value >= 1 && rating.value <= 5) {
        await updateServiceRating(serviceID, rating.value);
        await saveCommentToFirestore(
            serviceID); // تخزين التعليق بعد تحديث التقييم
        clearInputFields();

        TLoaders.successSnackBar(
          title: 'success'.tr,
          message: 'successComments'.tr,
        );
      } else {
        TLoaders.errorSnackBar(
          title: 'error'.tr,
          message: 'errorRating'.tr,
        );
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: 'error'.tr,
        message: 'errorComments $e'.tr,
      );
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }

  UserModel currentUser = UserController.instance.user.value;

  Future<void> saveCommentToFirestore(String userID) async {
    final commentData = {
      'userEvaluation': currentUser.id, // يمكنك استخدام اسم المستخدم الفعلي
      'userID': userID,
      'date': DateTime.now().toIso8601String(),
      'comment': commentController.text,
      'ratingProfile': rating.value,
    };

    await _db.collection('comments').add(commentData);
  }
}
