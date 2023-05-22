import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/services/storage_service.dart';
import 'package:uuid/uuid.dart';

class FireStoreService {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<String> uploadPost(String caption, Uint8List file, String uid,
      String username, String profilePic) async {
    String res = "some error occured";

    try {
      String photoUrl =
          await StorageService().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      Post post = Post(
        caption: caption,
        uid: uid,
        username: username,
        postId: postId,
        datePosted: DateTime.now().toString(),
        postUrl: photoUrl,
        profilePic: profilePic,
        likes: [],
      );

      _store.collection('posts').doc(postId).set(
            post.toJSON(),
          );
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _store.collection('posts').doc(postId).update(
          {
            'likes': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _store.collection('posts').doc(postId).update(
          {
            'likes': FieldValue.arrayUnion([uid])
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
