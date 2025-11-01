import 'package:chat_messenger_app/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController _messageController=TextEditingController();
  final ChatService _chatService=ChatService();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  void sendMessage()async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(
          widget.receiveUserID, _messageController.text);
      //clear controller
      _messageController.clear();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveuserEmail),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
