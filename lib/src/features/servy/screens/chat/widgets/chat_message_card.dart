import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(index % 2 == 0 ? 16 : 0),
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomRight: Radius.circular(index % 2 == 0 ? 0 : 16),
              ),
            ),
            color: index % 2 == 0 ? TColors.chatColor : TColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width / 2 - 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("message"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "06:15 pm",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(width: 6),
                        index % 2 == 0
                            ? const SizedBox()
                            : const Icon(
                                Iconsax.tick_circle,
                                size: 18,
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
