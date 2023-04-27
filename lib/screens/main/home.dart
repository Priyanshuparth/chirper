import 'package:chirper/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add)),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('drawer header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('logout'),
              onTap: () async {
                _authService.signOut();
              },
            ),
          ],
        )),
      );
  }
}
