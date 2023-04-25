import 'package:chirper/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          home: SignUp(),
        );
        }
        return Text("Loading");
         
      },
    );
  }


}

