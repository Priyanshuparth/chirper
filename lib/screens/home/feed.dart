import 'package:chirper/screens/main/posts/list.dart';
import 'package:chirper/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PostService _postService=PostService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: _postService.getFeed(),
      child: Scaffold(body: ListPosts()),
    );
  }
}