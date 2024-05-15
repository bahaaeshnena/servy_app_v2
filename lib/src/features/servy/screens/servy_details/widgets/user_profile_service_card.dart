import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class TUserProfilsServiceCard extends StatelessWidget {
  const TUserProfilsServiceCard({
    super.key,
    required this.onPressed,
    required this.service,
    this.icon,
  });
  final VoidCallback onPressed;
  final ServiceModel service;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final userImage = service.userImage;
        final image = userImage!.isNotEmpty ? userImage : TImages.user;

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
                isNetworkImage: userImage.isNotEmpty,
              );
      }),
      title: FutureBuilder(
        future:
            UserController.instance.getFieldValue(service.ownerId!, 'Username'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text(
              snapshot.data.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            );
          }
        },
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: TColors.primaryColor,
        ),
      ),
    );
  }
}
