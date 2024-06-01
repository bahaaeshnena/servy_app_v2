import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/room_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/widgets/chat_card.dart';
import 'package:servy_app/src/features/servy/screens/chat/widgets/custom_field.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: TAppBar(
        title: Text('chatPage'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [Text('enterPersonName'.tr)],
                      ),
                      const SizedBox(height: TSizes.inputFieldRadius),
                      CustomField(
                        controller: controller,
                      ),
                      const SizedBox(height: TSizes.inputFieldRadius),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                FireData()
                                    .createRoom(controller.text)
                                    .then((value) {
                                  setState(() {
                                    controller.text = "";
                                  });
                                  Get.back();
                                });
                              }
                            },
                            child: Text('createChat'.tr)),
                      )
                    ],
                  ),
                );
              });
        },
        child: const Icon(Iconsax.message_add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .where(
                        'members',
                        arrayContains: FirebaseAuth.instance.currentUser!.uid,
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ChatRoomModel> items = snapshot.data!.docs
                          .map((e) => ChatRoomModel.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) =>
                              b.lastMessageTime!.compareTo(a.lastMessageTime!),
                        );
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ChatCard(
                              item: items[index],
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
