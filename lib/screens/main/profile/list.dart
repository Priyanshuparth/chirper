import 'package:chirper/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  @override
  Widget build(BuildContext context) {
  final users = Provider.of<List<UserModel?>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context,index){
        final user = users[index];
        return InkWell(
          onTap: ()=>Navigator.pushNamed(context,'/profile',arguments: user.id),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10),
              child: Row(
                children:[
                user?.profileImageUrl! !='' ?
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user!.profileImageUrl!),
                ):Icon(Icons.person,size: 40),
                SizedBox(width: 10),
                Text(user!.name!)
                ])),
              const Divider(thickness: 1,)
            ],
          ),
        );
      },
    );
  }
}