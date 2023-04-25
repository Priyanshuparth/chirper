import 'package:chirper/models/user.dart';
import 'package:chirper/screens/auth/signup.dart';
import 'package:chirper/screens/wrapper.dart';
import 'package:chirper/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization =Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          // return SomethingWentWrong();
        }
        if(snapshot.connectionState==ConnectionState.done){
          return StreamProvider<UserModel>.value(
            value: AuthService().user,
            child: MaterialApp(home:Wrapper()),
          );
        }
        return Text("Loading");
         
      },
    );
  }


}

