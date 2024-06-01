import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/images/circular_image_with_assest.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
    this.isNetworkimage = false,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkimage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImageWithAssetImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm,
              backgroundColor: backgroundColor,
              overlayColor: TColors.dark,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
