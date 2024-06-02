import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/message_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/room_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/screens/chat_room.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/date_time/date_time.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart'; // import TImages

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.item,
  });
  final ChatRoomModel item;

  @override
  Widget build(BuildContext context) {
    if (item.members == null || item.members!.isEmpty) {
      return const Center(
        child: Text('No members found in this chat room.'),
      );
    }

    List filteredMembers = item.members!
        .where((element) => element != FirebaseAuth.instance.currentUser!.uid)
        .toList();

    if (filteredMembers.isEmpty) {
      return const Center(
        child: Text('No other members found in this chat room.'),
      );
    }

    String userId = filteredMembers.first;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.exists) {
            var userData = snapshot.data!.data() as Map<String, dynamic>;
            UserModel chatuser = UserModel.fromJson(userData);

            return Card(
                child: ListTile(
              onTap: () {
                Get.to(() => ChatRoom(
                      roomId: item.id.toString(),
                      userChat: chatuser,
                    ));
              },
              leading: FutureBuilder(
                future: UserController.instance
                    .getFieldValue(userId, 'ProfilePicture'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const TShimmerEffect(width: 50, height: 50);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return TCircularImage(
                      image: snapshot.data.toString(),
                      width: 50,
                      height: 50,
                    );
                  }
                },
              ),
              title: Text(
                chatuser.username,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
              subtitle: Text(
                item.lastMessage == null || item.lastMessage!.isEmpty
                    ? chatuser.username
                    : item.lastMessage!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('rooms')
                    .doc(item.id)
                    .collection('messages')
                    .snapshots(),
                builder: (context, messageSnapshot) {
                  if (messageSnapshot.hasData && messageSnapshot.data != null) {
                    final unReadList = messageSnapshot.data!.docs
                        .map((e) =>
                            Message.fromJson(e.data() as Map<String, dynamic>))
                        .where((element) => element.read == "")
                        .where((element) =>
                            element.fromId !=
                            FirebaseAuth.instance.currentUser!.uid)
                        .toList();

                    return unReadList.isNotEmpty
                        ? Badge(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            label: Text(unReadList.length.toString()),
                            largeSize: 30,
                            backgroundColor: TColors.primaryColor,
                          )
                        : Text(MyDateTime.dateAndTime(item.lastMessageTime!)
                            .toString());
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ));
          } else {
            return const Center();
          }
        });
  }
}
