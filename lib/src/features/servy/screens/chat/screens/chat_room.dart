import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_storage.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/message_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/widgets/chat_message_card.dart';

class ChatRoom extends StatefulWidget {
  final String roomId;
  final UserModel userChat;
  const ChatRoom({super.key, required this.roomId, required this.userChat});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController msgController = TextEditingController();
  List selectedMsg = [];
  List<String> copyMsg = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Column(
          children: [
            Text(widget.userChat.username),
            Text(
              widget.userChat.lastActivated!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          copyMsg.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: copyMsg.join(' \n')));
                    Fluttertoast.showToast(
                      msg: 'copy'.tr,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    setState(() {
                      copyMsg.clear();
                      selectedMsg.clear();
                    });
                  },
                  icon: const Icon(Iconsax.copy))
              : const SizedBox(),
          // IconButton(onPressed: () {}, icon: const Icon(Iconsax.trash)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.more_circle)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .doc(widget.roomId)
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Message> messageItems = snapshot.data!.docs
                          .map((e) => Message.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) => b.createdAt!.compareTo(a.createdAt!),
                        );

                      return messageItems.isNotEmpty
                          ? ListView.builder(
                              reverse: true,
                              itemCount: messageItems.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // ignore: prefer_is_empty
                                      selectedMsg.length > 0
                                          ? selectedMsg.contains(
                                                  messageItems[index].id)
                                              ? selectedMsg.remove(
                                                  messageItems[index].id)
                                              : selectedMsg
                                                  .add(messageItems[index].id)
                                          : null;
                                      copyMsg.isNotEmpty
                                          ? messageItems[index].type == 'text'
                                              ? copyMsg.contains(
                                                      messageItems[index].msg)
                                                  ? copyMsg.remove(
                                                      messageItems[index].msg!)
                                                  : copyMsg.add(
                                                      messageItems[index].msg!)
                                              : null
                                          : null;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      selectedMsg
                                              .contains(messageItems[index].id)
                                          ? selectedMsg
                                              .remove(messageItems[index].id)
                                          : selectedMsg
                                              .add(messageItems[index].id);
                                      messageItems[index].type == 'text'
                                          ? copyMsg.contains(
                                                  messageItems[index].msg)
                                              ? copyMsg.remove(
                                                  messageItems[index].msg!)
                                              : copyMsg
                                                  .add(messageItems[index].msg!)
                                          : null;
                                    });
                                  },
                                  child: ChatMessageCard(
                                    messageItem: messageItems[index],
                                    index: index,
                                    roomId: widget.roomId,
                                    selected: selectedMsg
                                        .contains(messageItems[index].id),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  FireData().sendMessage(widget.userChat.id,
                                      'Assulamu Alaikum 👋', widget.roomId);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '👋',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Say Assulamu Alaikum ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    }
                    return Container();
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
                      controller: msgController,
                      minLines: 1,
                      maxLines: 20,
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.emoji_happy),
                            ),
                            IconButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  FireStorage().sendImage(
                                    file: File(image.path),
                                    roomId: widget.roomId,
                                    uid: widget.userChat.id,
                                  );
                                }
                              },
                              icon: const Icon(Iconsax.camera),
                            ),
                          ],
                        ),
                        border: InputBorder.none,
                        hintText: 'Message',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ),
                IconButton.filled(
                    onPressed: () {
                      if (msgController.text.isNotEmpty) {
                        FireData()
                            .sendMessage(widget.userChat.id, msgController.text,
                                widget.roomId)
                            .then((value) {
                          setState(() {
                            msgController.text = "";
                          });
                        });
                      }
                    },
                    icon: const Icon(Iconsax.send_1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
