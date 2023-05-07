import 'package:chirper/models/user.dart';
import 'package:chirper/screens/auth/signup.dart';
import 'package:chirper/screens/main/home.dart';
import 'package:chirper/screens/main/posts/add.dart';
import 'package:chirper/screens/main/posts/replies.dart';
import 'package:chirper/screens/main/profile/edit.dart';
import 'package:chirper/screens/main/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chirper/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if(user==null)
    {
      // show auth system routes
      return SignUp();
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
        '/add':(context)=>Add(),
        '/profile':(context)=>Profile(),
        '/edit':(context)=>Edit(),
        '/replies':(context)=>Replies()
      },
    );
    // show main system routes
    return Home();
  }
}