import 'package:chirper/screens/home/search.dart';
import 'package:chirper/screens/home/feed.dart';
import 'package:chirper/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;
  final List<Widget> _children = [
    Feed(),
    Search(),
  ];

  void onTabPressed(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
        BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: new Icon(Icons.search), label: 'search'),
        //BottomNavigationBarItem(icon: new Icon(Icons.home),label: 'home'),
      ]),
      body: _children[_currentIndex],
    );
  }
}
