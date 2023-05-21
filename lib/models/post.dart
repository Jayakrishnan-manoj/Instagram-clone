import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String caption;
  final String uid;
  final String username;
  final String postId;
  final String datePosted;
  final String postUrl;
  final String profilePic;
  final likes;

  Post({
    required this.caption,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePosted,
    required this.postUrl,
    required this.profilePic,
    required this.likes,
  }
  );

  Map<String, dynamic> toJSON() => {
        "caption": caption,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePosted": datePosted,
        "profilePic": profilePic,
        "postUrl": postUrl,
        "likes" : likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      caption: snapshot['caption'],
      uid: snapshot['uid'],
      postUrl: snapshot['postUrl'],
      username: snapshot['username'],
      datePosted: snapshot['datePosted'],
      postId: snapshot['postId'],
      likes: snapshot['likes'],
      profilePic: snapshot['profilePic']
    );
  }
}
