import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';
import 'package:uuid/uuid.dart';

class ServiceController extends GetxController {
  // static ServiceController get instance => Get.find();

  var isChecked = false.obs;
  var isChecked2 = false.obs;
  var imageUploading = false.obs;

  var isPosting = false.obs; // متغير يحدد ما إذا كانت العملية جارية أم لا
  var postMessage = ''.obs; // رسالة نصية تظهر بعد اكتمال العملية
  Rx<ServiceModel> services = ServiceModel.empty().obs;

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

  //! rating
  TextEditingController ratingController = TextEditingController();
  RxDouble rating = 0.0.obs; // Add RxDouble for rating

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
    isChecked = false.obs;
    isChecked2 = false.obs;
    super.onClose();
  }

//!---------------------Rating----------------------

  void updateRating(String value) {
    final int? ratingValue = int.tryParse(value);
    if (ratingValue != null && ratingValue >= 1 && ratingValue <= 5) {
      rating.value = ratingValue.toDouble();
    } else {
      rating.value = 0.0; // Reset rating if invalid value
    }
  }

  Future<void> updateServiceRating(String serviceID, double newRating) async {
    final serviceRef = _db.collection('Services').doc(serviceID);

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
      if (rating.value >= 1.0 && rating.value <= 5.0) {
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

//!---------------------Active Dicount----------------------
  void toggleDiscount(bool newValue) {
    isChecked2.value = newValue;
    // تحديث قيمة hasDiscount في كل الخدمات
    for (var service in service) {
      service.hasDiscount = newValue;
    }
  }

//!---------------------Active crossServices----------------------
  void toggleCrossServices(bool newValue) {
    isChecked.value = newValue;
    // تحديث قيمة hasDiscount في كل الخدمات
    for (var service in service) {
      service.hasDiscount = newValue;
    }
  }

//!----------------------Add favorite------------------

  void toggleFavorite(ServiceModel service) {
    bool isFavorite = favoriteServices.contains(service);
    if (isFavorite) {
      favoriteServices.remove(service);
      service.isLikedState = false; // تحديث الحالة
    } else {
      favoriteServices.add(service);
      service.isLikedState = true; // تحديث الحالة
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

  //!---------------------update cheackBox2(active discount) service----------------------

  void updateDiscountStatus(String serviceID, bool newValue) async {
    try {
      await _db.collection('Services').doc(serviceID).update({
        'hasDiscount': newValue,
      });
    } catch (e) {
      // إدارة الأخطاء هنا
    }
  }
  //!---------------------update cheackBox1(active crossServices) service----------------------

  void updateCrossServiceStatus(String serviceID, bool newValue) async {
    try {
      await _db.collection('Services').doc(serviceID).update({
        'hasCorresService': newValue,
      });
    } catch (e) {
      // إدارة الأخطاء هنا
    }
  }

  //!---------------------update service----------------------------
  void updateServiceData(
    ServiceModel updatedService,
  ) async {
    try {
      // يفتح Loading للتحديث
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.procsingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      ///////////////////////////////////
      if (_imageFile != null) {
        await uploadImage();
        updatedService.imageService =
            _imageUrl ?? ''; // تحديث رابط الصورة في البيانات
      }
      // قم بتحديث البيانات في Firebase Firestore باستخدام معرف الخدمة
      await _db.collection('Services').doc(updatedService.serviceID).update({
        'title': updatedService.title,
        'descreption': updatedService.descreption,
        'priceFrom': updatedService.priceFrom,
        'corssPodingService': updatedService.corssPodingService,
        'descrCorssPodingService': updatedService.descrCorssPodingService,
        'priceFromDescount': updatedService.priceFromDescount,
        'categoris': updatedService.categoris,
        'status': 'pending', // تحديث قيمة الحالة هنا
        'imageService': updatedService.imageService,

        // قم بتحديث المزيد من الحقول حسب الحاجة
      });

      // يحدث القائمة المحلية للخدمات بعد التحديث
      int index = service.indexWhere(
          (element) => element.serviceID == updatedService.serviceID);
      if (index != -1) {
        service[index] = updatedService;
      }
      clearInputFields();
      Get.back();
      // قم بإيقاف ال Loading بعد التحديث
      TFullScreenLoader.stopLoading();

      // عرض رسالة نجاح
      TLoaders.successSnackBar(
        title: "Success",
        message: 'Service updated successfully',
      );
      TLoaders.warningSnackBar(
        title: "info",
        message: 'Modifications will be reviewed by the admin',
      );
    } catch (e) {
      // إدارة الأخطاء هنا
      TLoaders.errorSnackBar(
        title: "Error",
        message: 'Failed to update service: $e',
      );
    }
  }

  //!---------------------delete service----------------------------
  void deleteService(String servece) async {
    try {
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.procsingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      await _db.collection('Services').doc(servece).delete();
      service.removeWhere((element) => element.serviceID == servece);
      update(); // Update the UI after removing the service
      Navigator.of(Get.overlayContext!).pop();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: "Success",
        message: 'Service deleted successfully',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: "Error",
        message: 'Failed to delete service: $e',
      );
    }
  }

  //!---------------------get services----------------------------
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
  //!---------------------update get services----------------------------

  void updateGetServices(List<ServiceModel> newPosts) {
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
  //!---------------------Clear textField add page----------------------------

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
      title: "Done".tr,
      message: 'The service has been deployed successfully',
    );
    clearInputFields();
  }
  //!---------------------Pick Image----------------------------

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _imageFile = File(pickedImage.path);
      update(); // يحدث الـ Obx المتعلقة بالصورة
    }
  }

  List<ServiceModel> getFavoriteServices() {
    // Logic to fetch favorite services
    // For example, you can filter the list of services to get only favorite ones
    return service.where((service) => service.isLikedState).toList();
  }
  //!---------------------Upload Image----------------------------

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
  //!---------------------add service----------------------------

  Future<void> addService() async {
    try {
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.procsingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await uploadImage();

      // التحقق من وجود صورة
      if (_imageFile == null) {
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
        descrCorssPodingService: descrCorssPodingService.text,
        ownerId: currentUser.id,
        ownerEmail: currentUser.email,
        priceFromDescount: priceFromDescount.text,
        status: 'pending',
        categoris: categories.text,
        hasDiscount: isChecked2.value,
        hasCorresService: isChecked.value,
        userImage: currentUser.profilePicture,
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

      postMessage.value = 'The service has been deployed successfully';
      await _db.collection("Services").add(service.toJson());
      getServices();
      Get.find<ServiceController>().clearInputFields();

      TLoaders.successSnackBar(
        title: "Done".tr,
        message: 'The service has been deployed successfully',
      );
      TLoaders.warningSnackBar(
        title: "info",
        message: 'The service you posted is under review by admin',
      );
      // TFullScreenLoader.stopLoading();

      // Refresh page and clear input fields
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: 'Something went wrong: $e',
      );
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
