import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:uuid/uuid.dart';

class AddServicePageController extends GetxController {
  var isChecked = false.obs;
  var isChecked2 = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController descreption = TextEditingController();
  TextEditingController priceFrom = TextEditingController();
  TextEditingController corssPodingService = TextEditingController();
  TextEditingController descrCorssPodingService = TextEditingController();
  TextEditingController priceFromDescount = TextEditingController();
  TextEditingController categories = TextEditingController();
  GlobalKey<FormState> addPostFormKey = GlobalKey<FormState>();

  final _db = FirebaseFirestore.instance;
  final RxList<ServiceModel> posts = RxList<ServiceModel>([]);

  @override
  void onInit() {
    super.onInit();
    getposts();
  }

  void getposts() async {
    try {
      UserModel currentUser = UserController.instance.user.value;
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("Posts")
          .where('ownerId', isEqualTo: currentUser.id)
          .get();
      posts.value =
          snapshot.docs.map((doc) => ServiceModel.fromSnapshot(doc)).toList();
    } catch (e) {
      // Handle error here
    }
  }

  void updatePosts(List<ServiceModel> newPosts) {
    posts.value = newPosts;
  }

  void acceptPost(String postId) async {
    try {
      await _db.collection("Posts").doc(postId).update({"status": "accepted"});
      getposts(); // تحديث البيانات بعد التحديث
      // إرسال إشعارات أو تنبيهات إضافية هنا إذا لزم الأمر
    } catch (e) {
      // إدارة الأخطاء هنا
    }
  }

  void clearInputFields() {
    title.clear();
    descreption.clear();
    priceFrom.clear();
    corssPodingService.clear();
    descrCorssPodingService.clear();
    priceFromDescount.clear();
    categories.clear();
  }

  void showSuccessMessageAndClearInputs() {
    TLoaders.successSnackBar(
      title: "Done",
      message: 'The service has been deployed successfully',
    );
    clearInputFields();
  }

  void addPost() async {
    try {
      if (!addPostFormKey.currentState!.validate()) {
        return;
      }

      UserModel currentUser = UserController.instance.user.value;

      var postId = const Uuid().v4(); // توليد معرف UUID جديد
      var post = ServiceModel(
        id: postId,
        title: title.text,
        descreption: descreption.text,
        imageService: '',
        priceFrom: priceFrom.text,
        corssPodingService: corssPodingService.text,
        ownerId: currentUser.id,
        priceFromDescount: priceFromDescount.text,
        status: 'pending',
        categoris: categories.text,
      );
      // Ensure that priceFromDescount is less than priceFrom
      if (isChecked2.value) {
        double priceFromValue = double.tryParse(priceFrom.text) ?? 0;
        double priceFromDescountValue =
            double.tryParse(priceFromDescount.text) ?? 0;
        if (priceFromDescountValue >= priceFromValue) {
          TLoaders.errorSnackBar(
              title: 'Validation Error',
              message: 'Price from discount must be less than price from');
          return;
        }
      }

      await _db.collection("Posts").add(post.toJson());
      getposts();

      TLoaders.successSnackBar(
          title: "Done", message: 'The service has been deployed successfully');
      TLoaders.warningSnackBar(
          title: "info",
          message: 'The service you posted is under review by admin');
      // Refresh page and clear input fields
      Get.find<AddServicePageController>().clearInputFields();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    }
  }
}
