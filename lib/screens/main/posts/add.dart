import 'package:chirper/services/posts.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweet'),
        actions: <Widget>[
          TextButton(
            onPressed: () async{
              _postService.savePost(text);
              Navigator.pop(context);
            },
            child: Text('Tweet',style: TextStyle(color: Colors.white))
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: new Form(
          child: TextFormField(
            onChanged: (val){
              setState(() {
                text=val;
              });
            },
          )
        ),
      )
    );
  }
}