import 'dart:io';

import 'package:chirper/services/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  UserService _userService = UserService();
  File? _proflieImage;
  File? _bannerImage;

  final picker =ImagePicker();
  String name='';
  String bio='';

  Future getImage(int type) async{
    final pickedFile=await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile !=null &&type==0){
        _proflieImage=File(pickedFile.path);
      }
      if(pickedFile !=null &&type==1){
        _bannerImage=File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(onPressed: () async{
          await _userService.updateProfile(_bannerImage!, _proflieImage!, name);
          Navigator.pop(context);
        }, child: Text('Save'))
      ],),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: new Form(
          child: Column(
            children: [
              TextButton(
                onPressed: ()=>getImage(0),
                child: _proflieImage==null ?
                  Icon(Icons.person) :
                  Image.file(
                    _proflieImage!,
                    height: 100,
                    ),
                ),
              TextButton(
                onPressed: ()=>getImage(1),
                child: _bannerImage==null ?
                  Icon(Icons.person) :
                  Image.file(
                    _bannerImage!,
                    height: 100,
                    ),
                ),
              TextFormField(
              onChanged: (val)=>setState(() {
                name=val;
              }),
            )],
        ),),
      ),
    );
  }
}