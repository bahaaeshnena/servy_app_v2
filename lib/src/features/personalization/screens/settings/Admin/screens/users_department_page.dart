import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class UsersDepartment extends StatelessWidget {
  const UsersDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: TAppBar(
        title: Text('usersDepartment'.tr),
        showBackArrow: true,
      ),
      body: StreamBuilder<List<UserModel>>(
        stream: userController.userRepository.getAllUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('noUserFound'.tr));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePicture),
                    child: FadeInImage(
                      placeholder: const AssetImage(TImages.user),
                      image: NetworkImage(user.profilePicture),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(TImages.user, fit: BoxFit.cover);
                      },
                    ),
                  ),
                  title: Text(
                    user.email,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  subtitle: Text(
                    user.id,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        contentPadding: const EdgeInsets.all(TSizes.md),
                        title: "titleOption4".tr,
                        middleText: 'messageDeleteAccount'.tr,
                        confirm: ElevatedButton(
                          onPressed: () async {
                            userController.deleteUserWithAdmin(user.email);
                            Navigator.of(Get.overlayContext!).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.lg,
                            ),
                            child: Text('delete'.tr),
                          ),
                        ),
                        cancel: OutlinedButton(
                          onPressed: () =>
                              Navigator.of(Get.overlayContext!).pop(),
                          child: Text("cancel".tr),
                        ),
                      );
                    },
                    icon: const Icon(
                      Iconsax.user_remove,
                      size: 30,
                      color: Colors.redAccent,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
