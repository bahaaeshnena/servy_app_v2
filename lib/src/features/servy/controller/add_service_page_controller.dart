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
  GlobalKey<FormState> addPostFormKey = GlobalKey<FormState>();

  final _db = FirebaseFirestore.instance;
  final RxList<ServiceModel> posts = RxList<ServiceModel>([]);

  @override
  void onInit() {
    super.onInit();
    getposts();
  }

  void getposts() async {
    UserModel currentUser = UserController.instance.user.value;
    await _db
        .collection("Posts")
        .where('ownerId', isEqualTo: currentUser.id)
        .get()
        .then((value) {
      posts.value =
          value.docs.map((e) => ServiceModel.fromSnapshot(e)).toList();
    });
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
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    }
  }
}
