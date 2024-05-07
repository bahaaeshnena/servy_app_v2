import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:uuid/uuid.dart';

class ServiceController extends GetxController {
  var isChecked = false.obs;
  var isChecked2 = false.obs;

  RxList<ServiceModel> favoriteServices = <ServiceModel>[].obs;
  final RxList<ServiceModel> service = RxList<ServiceModel>([]);
  RxList<ServiceModel> filteredServices = <ServiceModel>[].obs;

  TextEditingController title = TextEditingController();
  TextEditingController descreption = TextEditingController();
  TextEditingController priceFrom = TextEditingController();
  TextEditingController corssPodingService = TextEditingController();
  TextEditingController descrCorssPodingService = TextEditingController();
  TextEditingController priceFromDescount = TextEditingController();
  TextEditingController categories = TextEditingController();
  GlobalKey<FormState> addPostFormKey = GlobalKey<FormState>();

  final _db = FirebaseFirestore.instance;

  File? _imageFile;
  String? _imageUrl;
  File? get imageFile => _imageFile;
  String? get imageUrl => _imageUrl;

  @override
  void onInit() {
    super.onInit();
    getServices();
  }

  @override
  void onClose() {
    title.dispose();
    descreption.dispose();
    priceFrom.dispose();
    corssPodingService.dispose();
    descrCorssPodingService.dispose();
    priceFromDescount.dispose();
    categories.dispose();
    super.onClose();
  }
//!----------------------Add favorite------------------

  void toggleFavorite(ServiceModel services) {
    if (favoriteServices.contains(services)) {
      favoriteServices.remove(services);
      TLoaders.warningSnackBar(
        title: "Done",
        message: 'Remove from favorites page',
      );
    } else {
      favoriteServices.add(services);
      TLoaders.successSnackBar(
        title: "Done",
        message: 'Added to favorites page',
        duration: 1,
      );
    }
  }

  //!-----------------Search-----------------------
  void searchByTitle(String query) {
    if (query.isEmpty) {
      filteredServices.assignAll(service);
    } else {
      filteredServices.assignAll(service.where((service) =>
          service.title.toLowerCase().contains(query.toLowerCase())));
    }
  }

  //!-------------------------------------------------
  void getServices() async {
    try {
      UserModel currentUser = UserController.instance.user.value;
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("Services")
          .where('ownerId', isEqualTo: currentUser.id)
          .get();
      service.value =
          snapshot.docs.map((doc) => ServiceModel.fromSnapshot(doc)).toList();
    } catch (e) {
      // Handle error here
    }
  }

  void updateServices(List<ServiceModel> newPosts) {
    service.value = newPosts;
  }

  void acceptServices(String postId) async {
    try {
      await _db
          .collection("Services")
          .doc(postId)
          .update({"status": "accepted"});
      getServices(); // تحديث البيانات بعد التحديث
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
    _imageFile = null;
    _imageUrl = null;
    update();
    // تفريغ الصورة المحددة
  }

  void showSuccessMessageAndClearInputs() {
    TLoaders.successSnackBar(
      title: "Done",
      message: 'The service has been deployed successfully',
    );
    clearInputFields();
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _imageFile = File(pickedImage.path);
      update(); // يحدث الـ Obx المتعلقة بالصورة
    }
  }

  Future<void> uploadImage() async {
    if (_imageFile == null) return;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('service_images')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(_imageFile!);
      _imageUrl = await ref.getDownloadURL();
    } catch (e) {
      // إدارة الأخطاء هنا
    }
  }

  Future<void> addPost() async {
    try {
      await uploadImage();

      // التحقق من وجود صورة
      if (_imageFile == null) {
        // عرض رسالة خطأ وعدم تقديم النموذج إذا لم يتم تحميل الصورة
        TLoaders.errorSnackBar(
          title: 'Error',
          message: 'Please select an image before submitting.',
        );
        return;
      }

      if (!addPostFormKey.currentState!.validate()) {
        return;
      }

      UserModel currentUser = UserController.instance.user.value;

      var serviceId = const Uuid().v4(); // توليد معرف UUID جديد
      var service = ServiceModel(
        serviceID: serviceId,
        title: title.text,
        descreption: descreption.text,
        imageService: _imageUrl ?? '',
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
            message: 'Price from discount must be less than price from',
          );
          return;
        }
      }

      await _db.collection("Services").add(service.toJson());
      getServices();

      TLoaders.successSnackBar(
        title: "Done",
        message: 'The service has been deployed successfully',
      );
      TLoaders.warningSnackBar(
        title: "info",
        message: 'The service you posted is under review by admin',
      );
      // Refresh page and clear input fields
      Get.find<ServiceController>().clearInputFields();
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: 'Something went wrong: $e',
      );
    }
  }
}
