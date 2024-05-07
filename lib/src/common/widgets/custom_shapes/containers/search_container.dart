import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/search_delegate.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/device/device_utility.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    required this.onSearchTextChanged,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final Function(String) onSearchTextChanged;

  @override
  // ignore: library_private_types_in_public_api
  _TSearchContainerState createState() => _TSearchContainerState();
}

class _TSearchContainerState extends State<TSearchContainer> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () async {
        final searchText = await showSearch<String>(
          context: context,
          delegate: CustomSearchDelegate(widget.onSearchTextChanged),
        );
        if (searchText != null) {
          // Handle search text if needed
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: widget.showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: widget.showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: dark ? Colors.white : Colors.grey),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  widget.text,
                  style:
                      TextStyle(color: dark ? Colors.grey[400] : Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
