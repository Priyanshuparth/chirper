import 'package:chirper/models/post.dart';
import 'package:chirper/models/user.dart';
import 'package:chirper/screens/main/posts/Item.dart';
import 'package:chirper/services/posts.dart';
import 'package:chirper/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({super.key});

  @override
  State<ListPosts> createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  UserService _userService = UserService();
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel>>(context) ?? [];
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        if(post.retweet)
        {
          return FutureBuilder(
            future: _postService.getPostById(post.originalId),
            builder: (BuildContext context,
              AsyncSnapshot<PostModel?> snapshotPost){
                if (!snapshotPost.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
                }
                return mainPost(snapshotPost.data!,true);
              });
        }
        return mainPost(post,false);
      },
    );
  }

  StreamBuilder<UserModel?> mainPost(PostModel post,bool retweet) {
    return StreamBuilder(
        stream: _userService.getUserInfo(post.creator),
        builder:
            (BuildContext context, AsyncSnapshot<UserModel?> snapshotUser) {
          if (!snapshotUser.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
    
          // stream builder to get user like
    
          return StreamBuilder(
              stream: _postService.getCurrentUserLike(post),
              builder:
                  (BuildContext context, AsyncSnapshot<bool> snapshotLike) {
                if (!snapshotLike.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
          return StreamBuilder(
              stream: _postService.getCurrentUserRetweet(post),
              builder:
                  (BuildContext context, AsyncSnapshot<bool> snapshortRetweet) {
                if (!snapshotLike.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
    
                // stream builder to get user like
                return ItemPost(post,snapshotUser,snapshotLike,snapshortRetweet,retweet);
              });
        });
  });
}
}
