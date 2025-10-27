import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiveuserEmail;
  final String receiveUserID;
  const ChatPage({super.key,
    required this.receiveuserEmail,
    required this.receiveUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveuserEmail),
      ),
    );
  }
}
