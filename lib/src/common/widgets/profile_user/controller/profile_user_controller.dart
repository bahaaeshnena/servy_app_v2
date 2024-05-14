import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isViewProfileVisible = true.obs;

  void toggleViewProfileVisibility() {
    isViewProfileVisible.value = !isViewProfileVisible.value;
  }
}
