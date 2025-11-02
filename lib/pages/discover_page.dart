import 'package:chat_messenger_app/components/MyLists.dart';
import 'package:chat_messenger_app/components/search_bar.dart';
import 'package:chat_messenger_app/components/stories.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CircleAvatar(minRadius: 10,backgroundColor: Colors.white,child: Icon(Icons.person,color: Colors.grey,)),
        ),
        title: Text("Discover",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
        centerTitle: false,
        backgroundColor: Colors.grey,


      ),
      body: Column(
        children: [
          MySearchBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Recently Used',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
              Text('See all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
              ],
            ),
          ),
          Stories(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Featured',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
                Text('See all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
              ],
            ),
          ),
          Mylists()
        ],
      ),

    );
  }
}
