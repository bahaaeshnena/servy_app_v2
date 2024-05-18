import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class CommunicationBrokers extends StatelessWidget {
  const CommunicationBrokers({
    super.key,
    required this.onPressedEmail,
  });
  final void Function() onPressedEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'communication :',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPressedEmail,
                icon: Icon(
                  Iconsax.message_add,
                  size: 50,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                ),
              ),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }
}
