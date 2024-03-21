import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  // ignore: unnecessary_string_interpolations
                  text: '${TText.iAgreeTo}',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                // ignore: unnecessary_string_interpolations
                text: '${TText.privacyPolicy}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? TColors.white : TColors.primaryColor),
              ),
              TextSpan(
                  // ignore: unnecessary_string_interpolations
                  text: '${TText.and}',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                // ignore: unnecessary_string_interpolations
                text: '${TText.termsOfUse}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? TColors.white : TColors.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
