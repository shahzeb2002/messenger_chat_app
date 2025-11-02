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

        title: Text("D I S C O V E R ",style: TextStyle(color: Colors.grey,),),
        centerTitle: true,
        backgroundColor:Colors.transparent,
        foregroundColor: Colors.grey,


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
