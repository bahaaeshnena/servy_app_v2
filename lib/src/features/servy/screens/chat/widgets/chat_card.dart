import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/servy/screens/chat/screens/chat_room.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(() => const ChatRoom());
        },
        leading: const CircleAvatar(),
        title: const Text('Name'),
        subtitle: const Text('Last Message'),
        trailing: const Badge(
          padding: EdgeInsets.symmetric(horizontal: 12),
          label: Text('3'),
          largeSize: 30,
          backgroundColor: TColors.primaryColor,
        ),
      ),
    );
  }
}
