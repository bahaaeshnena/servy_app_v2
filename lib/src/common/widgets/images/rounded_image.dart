import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.md),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(TSizes.md),
        child: Image(
          image: AssetImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
