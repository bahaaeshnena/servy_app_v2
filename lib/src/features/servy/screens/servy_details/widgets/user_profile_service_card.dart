import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class TUserProfilsServiceCard extends StatelessWidget {
  const TUserProfilsServiceCard({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;

        return controller.imageUploading.value
            ? const TShimmerEffect(
                width: 50,
                height: 50,
                radius: 80,
              )
            : TCircularImage(
                image: image,
                width: 50,
                height: 50,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!,
      ),
      // trailing: IconButton(
      //   onPressed: onPressed,
      //   icon: const Icon(
      //     Iconsax.edit,
      //     size: 28,
      //     color: TColors.white,
      //   ),
      // ),
    );
  }
}
