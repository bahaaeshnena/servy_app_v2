import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/message_model.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/room_model.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:uuid/uuid.dart';

class FireData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createRoom(String email) async {
    try {
      QuerySnapshot userEmail = await firestore
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get();

      if (userEmail.docs.isEmpty) {
        TLoaders.errorSnackBar(
            title: 'error'.tr, message: 'nouserfoundwiththisemail'.tr);
        return;
      }

      String userId = userEmail.docs.first.id;
      List<String> members = [myUid, userId]..sort((a, b) => a.compareTo(b));

      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('members', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoomModel chatRoom = ChatRoomModel(
          id: members.join('_'),
          members: members,
          createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
          lastMessage: '',
          lastMessageTime: DateTime.now().microsecondsSinceEpoch.toString(),
        );

        await firestore
            .collection('rooms')
            .doc(chatRoom.id)
            .set(chatRoom.toJSon());
      }
      TLoaders.successSnackBar(
          title: 'success'.tr, message: 'createChatMessage'.tr);
      return;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error'.tr, message: e.toString());
    }
  }

  Future sendMessage(String uid, String msg, String roomID,
      {String? type}) async {
    String msgId = const Uuid().v4();
    Message message = Message(
      id: msgId,
      toId: uid,
      fromId: myUid,
      msg: msg,
      type: type ?? 'text',
      createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
      read: '',
    );
    await firestore
        .collection('rooms')
        .doc(roomID)
        .collection('messages')
        .doc(msgId)
        .set(message.toJSon());

    firestore.collection('rooms').doc(roomID).update({
      'lastMessage': type ?? msg,
      'lastMessageTime': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  Future readMessage(String roomId, String msgId) async {
    try {
      await firestore
          .collection('rooms')
          .doc(roomId)
          .collection('messages')
          .doc(msgId)
          .update({
        'read': DateTime.now().millisecondsSinceEpoch.toString(),
      });
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error'.tr, message: e.toString());
    }
  }
}
