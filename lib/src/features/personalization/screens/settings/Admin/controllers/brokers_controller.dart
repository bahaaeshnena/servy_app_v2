import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/models/brokers_model.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';
import 'package:uuid/uuid.dart';

class BrokersController extends GetxController {
  static BrokersController get instance => Get.find();

  final RxList<BrokerModel> broker = RxList<BrokerModel>([]);

  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController function = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> addBrokerFormKey = GlobalKey<FormState>();

  var isPosting = false.obs; // متغير يحدد ما إذا كانت العملية جارية أم لا
  var postMessage = ''.obs; // رسالة نصية تظهر بعد اكتمال العملية

  final _db = FirebaseFirestore.instance;

  File? _imageFile;
  String? _imageUrl;
  File? get imageFile => _imageFile;
  String? get imageUrl => _imageUrl;

  //!---------------------Pick Image----------------------------

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _imageFile = File(pickedImage.path);
      update(); // يحدث الـ Obx المتعلقة بالصورة
    }
  }

  //!---------------------Upload Image----------------------------

  Future<void> uploadImage() async {
    if (_imageFile == null) return;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('brokers_images')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(_imageFile!);
      _imageUrl = await ref.getDownloadURL();
    } catch (e) {
      // إدارة الأخطاء هنا
    }
  }

  //!---------------------Clear textField add page----------------------------

  void clearInputFields() {
    username.clear();
    age.clear();
    country.clear();
    function.clear();
    desc.clear();
    email.clear();
    _imageFile = null;
    _imageUrl = null;

    update();
    // تفريغ الصورة المحددة
  }

  //!------------------fetch All Brokers data from Firebase-------------
  void fetchAllBrokers() {
    _db.collection('Brokers').snapshots().listen((querySnapshot) {
      broker.value = querySnapshot.docs
          .map((doc) => BrokerModel.fromSnapshot(doc))
          .toList();
    });
  }

//!---------------------delete Brokers----------------------------
  void deleteBrokers(String brokerId) async {
    try {
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.procsingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      await _db.collection('Brokers').doc(brokerId).delete();
      broker.removeWhere((element) => element.id == brokerId);
      update();
      Navigator.of(Get.overlayContext!).pop();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: "success".tr,
        message: 'successDeleted'.tr,
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: "error".tr,
        message: 'errorDeleted $e'.tr,
      );
    }
  }

//!---------------------update Broker----------------------------
  void updateBrokerData(
    BrokerModel updatedBroker,
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
        updatedBroker.image = _imageUrl ?? ''; // تحديث رابط الصورة في البيانات
      }
      // قم بتحديث البيانات في Firebase Firestore باستخدام معرف الخدمة
      await _db.collection('Brokers').doc(updatedBroker.id).update({
        'age': updatedBroker.age,
        'countrt': updatedBroker.country,
        'email': updatedBroker.email,
        'username': updatedBroker.username,
        'desc': updatedBroker.desc,
        'function': updatedBroker.function,
        'image': updatedBroker.image,
      });

      // يحدث القائمة المحلية للخدمات بعد التحديث
      int index =
          broker.indexWhere((element) => element.id == updatedBroker.id);
      if (index != -1) {
        broker[index] = updatedBroker;
      }
      clearInputFields();
      Get.back();
      // قم بإيقاف ال Loading بعد التحديث
      TFullScreenLoader.stopLoading();

      // عرض رسالة نجاح
      TLoaders.successSnackBar(
        title: "success".tr,
        message: 'successUpdateBroker'.tr,
      );
    } catch (e) {
      // إدارة الأخطاء هنا
      TLoaders.errorSnackBar(
        title: "error".tr,
        message: 'errorUpdateBroker $e',
      );
    }
  }
  //!---------------------add Brokers----------------------------

  Future<void> addBroker() async {
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
          title: 'error'.tr,
          message: 'errorImage'.tr,
        );
        return;
      }

      if (!addBrokerFormKey.currentState!.validate()) {
        return;
      }

      var brokerId = const Uuid().v4(); // توليد معرف UUID جديد
      var broker = BrokerModel(
          id: brokerId,
          image: _imageUrl ?? '',
          username: username.text,
          age: age.text,
          country: country.text,
          function: function.text,
          desc: desc.text,
          email: email.text);

      postMessage.value = 'postMessageBroker'.tr;
      await _db.collection("Brokers").add(broker.toJson());
      // getServices();
      clearInputFields();

      TLoaders.successSnackBar(
        title: "Done".tr,
        message: 'postMessageBroker'.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: 'ohSnap'.tr,
        message: 'ohSnapMessage $e'.tr,
      );
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
