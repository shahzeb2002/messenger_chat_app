import 'package:chat_messenger_app/services/auth/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instance of auth
  final FirebaseAuth _auth=FirebaseAuth.instance;


  //sign out
  void signOutt(){
    //getting auth service
    final authService = Provider.of<AuthService>(context,listen: false);
    authService.signOut();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_auth.currentUser!.email.toString()),
        centerTitle: true,
        actions: [
          //signout
          IconButton(onPressed: signOutt,
              icon: Icon(Icons.logout)),
        ],
      ),
      body: _buildUserList(),
    );
  }


  //building list of user excpet current

  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('error');
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return Text('Loading...');
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },

    );
  }

  // bulding individual user list item
Widget _buildUserListItem(DocumentSnapshot document){
    Map<String ,dynamic> data =document.data()! as Map<String, dynamic>;

    //displaying all except logged in
  if(_auth.currentUser!.email != data['email']){
    return ListTile(
      title: Text(data['email']),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiveuserEmail: data['email'], receiveUserID: data['uid'],),));

      },
    );
  }else{
    return Container();

  }


}


}
