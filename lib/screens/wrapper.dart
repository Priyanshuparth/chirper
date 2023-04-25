import 'package:chirper/models/user.dart';
import 'package:chirper/screens/auth/signup.dart';
import 'package:chirper/screens/main/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chirper/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if(user==null)
    {
      // show auth system routes
      return SignUp();
    }
    // show main system routes
    return Home();
  }
}