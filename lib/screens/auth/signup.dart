import 'package:chirper/constants/assets_constants.dart';
import 'package:chirper/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsConstants.twitterLogo),
        backgroundColor: Colors.blue,
        elevation: 8,
        //title: Text("Sign Up"),
        centerTitle: true,
      ),
      // body:SingleChildScrollView(
      //   child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(children: [
      //     TextFormField(

      //     )
      //   ]),
      //   ),
      // )

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: new Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Email...'),
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Password...'),
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Signup'),
                onPressed: () async => {_authService.signUp(email, password)},
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Colors.blue),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: Text('SignIn'),
                onPressed: () async => {_authService.signIn(email, password)},
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Colors.blue),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
