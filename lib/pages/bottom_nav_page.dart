import 'package:chat_messenger_app/pages/discover_page.dart';
import 'package:chat_messenger_app/pages/home_page.dart';
import 'package:chat_messenger_app/pages/people_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  // Screens for each tabs
  final List<Widget> _screens = const [
    HomePage(),
    PeoplePage(),
    DiscoverPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey,
        buttonBackgroundColor: Colors.white,
        color: Colors.grey.shade300,

        items: const [
           Icon(Icons.chat_bubble_outline_outlined),
            Icon(Icons.people_outline),
            Icon(Icons.find_in_page_outlined),


        ],
      ),
    );
  }

}
