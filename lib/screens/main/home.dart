import 'package:chirper/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService=AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          TextButton.icon(
            label:Text('SignOut'),
            style: TextButton.styleFrom(
    primary: Colors.black, // Text Color
  ),
            icon:Icon(Icons.person),
            onPressed: () async {_authService.signOut();}
          )
        ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.pushNamed(context, '/add');},
          child: Icon(Icons.add),
        ),
    );
  }
}