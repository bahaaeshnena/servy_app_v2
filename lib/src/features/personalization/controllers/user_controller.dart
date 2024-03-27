import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';

import '../../../utils/network/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  ///Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // ignore: unused_local_variable
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
          username: username,
          email: userCredential.user!.email ?? ' ',
          phoneNumber: userCredential.user!.phoneNumber ?? " ",
          profilePicture: userCredential.user!.photoURL ?? " ",
        );
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Date not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your date in your Profile.',
      );
    }
  }
}
