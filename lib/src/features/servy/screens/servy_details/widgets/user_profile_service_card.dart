import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
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
    return ListTile(
      leading: FutureBuilder(
        future: UserController.instance
            .getFieldValue(service.ownerId!, 'ProfilePicture'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TShimmerEffect(width: 50, height: 50);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return TCircularImage(
              image: snapshot.data.toString(),
              width: 50,
              height: 50,
            );
          }
        },
      ),
      title: FutureBuilder(
        future:
            UserController.instance.getFieldValue(service.ownerId!, 'Username'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TShimmerEffect(width: 100, height: 15);
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
