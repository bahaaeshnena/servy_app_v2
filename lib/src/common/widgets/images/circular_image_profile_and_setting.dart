import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class TCircularImageProfileAndSetting extends StatelessWidget {
  const TCircularImageProfileAndSetting({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.defaultImage,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });
  final BoxFit? fit;
  final String image;
  final String? defaultImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final imageUrl = image.isNotEmpty ? image : (defaultImage ?? '');
    final isNetwork = image.isNotEmpty ? isNetworkImage : false;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetwork
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(imageUrl),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
