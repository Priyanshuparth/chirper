import 'package:chirper/screens/main/posts/list.dart';
import 'package:chirper/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Replies extends StatefulWidget {
  const Replies({super.key});

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
        value: _postService.getFeed(),
        child: Container(
          child: Scaffold(
            body: Container(
              child: Column(children: [
                Expanded(child: ListPosts()),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Form(child: TextFormField()),
                    SizedBox(height: 10,),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue, // Text Color
                        ),
                        onPressed: (){
                          print("a");
                        },
                        child: Text("Reply"))
                  ]),
                )
              ]),
            ),
          ),
        ));
  }
}
