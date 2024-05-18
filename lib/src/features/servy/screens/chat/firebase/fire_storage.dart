import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<void> sendImage({
    required File file,
    required String roomId,
    required String uid,
  }) async {
    String ext = file.path.split('.').last;

    final ref = fireStorage.ref().child(
        'imagesChat/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext');

    // Wait for the upload to complete
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() => null);

    // Now fetch the download URL
    String imageUrl = await ref.getDownloadURL();

    // Send the message with the image URL
    FireData().sendMessage(uid, imageUrl, roomId, type: 'image');
  }
}
