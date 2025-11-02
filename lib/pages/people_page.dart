import 'package:chat_messenger_app/components/MyLists.dart';
import 'package:chat_messenger_app/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("P E O P L E S",style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        backgroundColor:Colors.transparent,
        foregroundColor: Colors.grey,

      ),
      body:Column(
        children: [
          MySearchBar(),
         Mylists(),
        ],
      )

    );
  }
}
