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
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CircleAvatar(minRadius: 10,backgroundColor: Colors.white,child: Icon(Icons.person,color: Colors.grey,)),
        ),
        title: Text("People",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: false,
        backgroundColor: Colors.grey,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.person_add_alt_outlined,size: 30,),
          ),

        ],
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
