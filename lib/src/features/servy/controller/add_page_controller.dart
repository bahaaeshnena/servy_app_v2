import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/models/posts_model.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';

class AddPageController extends GetxController {
  var isChecked = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController descreption = TextEditingController();
  TextEditingController priceFrom = TextEditingController();
  TextEditingController corssPodingService = TextEditingController();
  TextEditingController descrCorssPodingService = TextEditingController();
  GlobalKey<FormState> addPostFormKey = GlobalKey<FormState>();

  final _db = FirebaseFirestore.instance;
  final RxList<PostModel> posts = RxList<PostModel>([]);

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
      posts.value = value.docs.map((e) => PostModel.fromSnapshot(e)).toList();
    });
  }

  void addPost() async {
    try {
      if (!addPostFormKey.currentState!.validate()) {
        return;
      }

      UserModel currentUser = UserController.instance.user.value;

      var post = PostModel(
        title: title.text,
        descreption: descreption.text,
        imageService: '',
        priceFrom: priceFrom.text,
        corssPodingService: corssPodingService.text,
        ownerId: currentUser.id,
      );

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
