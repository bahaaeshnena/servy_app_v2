import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ContainerImageService extends StatelessWidget {
  const ContainerImageService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: TColors.darkGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_a_photo_outlined,
              size: 100,
            ),
            const SizedBox(height: 10),
            Text(
              'addImageService'.tr,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
