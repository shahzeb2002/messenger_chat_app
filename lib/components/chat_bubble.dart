import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color bgcolor;
  const ChatBubble({super.key,required this.message,required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

        color: bgcolor
      ),
      child: Text(message,style: TextStyle(fontSize: 16,color: Colors.white),),
      
    );
  }
}
