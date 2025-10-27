import 'package:chat_messenger_app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Text('hehe'),
        actions: [
          //signout
          IconButton(onPressed: signOutt,
              icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
