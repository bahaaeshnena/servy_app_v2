import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:servy_app/src/common/widgets/icons/circular_icon.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class ServyMainLargeImage extends StatelessWidget {
  const ServyMainLargeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: const Stack(
          children: [
            //?Main Large Image

            SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Image(
                  image: AssetImage(TImages.card),
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
              ),
            ),

            //? image Slider

            //?Appbar ICons

            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
