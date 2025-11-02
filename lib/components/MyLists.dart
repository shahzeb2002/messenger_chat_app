import 'package:flutter/material.dart';

class Mylists extends StatelessWidget {
  const Mylists({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundColor:Colors.grey ,child: Icon(Icons.person,color: Colors.white,)),
            title: Text('Shah'),
            trailing: Icon(Icons.handshake_outlined),
          );
        },
      ),
    );
  }
}
