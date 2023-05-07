import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String creator;
  final String text;
  final Timestamp timestamp;
  final String originalId;
  final bool retweet;

  int likesCount;
  int retweetCount;

  PostModel(
      {required this.id,
      required this.creator,
      required this.text,
      required this.timestamp,
      required this.likesCount,
      required this.retweetCount,
      required this.originalId,
      required this.retweet});
}
