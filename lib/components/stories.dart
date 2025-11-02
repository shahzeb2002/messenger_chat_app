import 'package:flutter/material.dart';
class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of users
    final List<Map<String, String>> users = [
      {'name': 'You', 'image': 'images/1.JPG'},
      {'name': 'Alex', 'image': 'images/2.JPG'},
      {'name': 'Sara', 'image': 'images/tupac.jpg'},
      {'name': 'John', 'image': 'https://i.pravatar.cc/150?img=4'},
      {'name': 'Emily', 'image': 'https://i.pravatar.cc/150?img=5'},
      {'name': 'David', 'image': 'https://i.pravatar.cc/150?img=6'},
      {'name': 'Lisa', 'image': 'https://i.pravatar.cc/150?img=7'},
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
            itemBuilder: (context, index) {
              final user=users[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.person,color: Colors.grey,),),
                      ),
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
