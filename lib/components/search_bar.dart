import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        elevation: MaterialStateProperty.all(0),
        hintText: "Search",
        backgroundColor: MaterialStatePropertyAll(Colors.grey),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),

        leading: Icon(Icons.search),
      ),
    );
  }
}
