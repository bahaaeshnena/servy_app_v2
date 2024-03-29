import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
  });
  final String image;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return SizedBox(
            height: 80,
            child: TVerticalImageText(
              image: image,
              title: title,
              onTap: onPressed,
            ),
          );
        },
      ),
    );
  }
}
