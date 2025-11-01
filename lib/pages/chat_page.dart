import 'package:chat_messenger_app/components/chat_bubble.dart';
import 'package:chat_messenger_app/components/my_text_field.dart';
import 'package:chat_messenger_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.receiveuserEmail),
      ),
      body: Column(
        children: [
          //messages
          Expanded(child: _buildMessageList(),
          ),
          //userinput
          _buildMessageInput(),
          SizedBox(height: 25,)



        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList(){
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiveUserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState==ConnectionState.waiting){
            return const Text('Loading....');
          }
          return ListView(
            children: snapshot.data!.docs.map((document) => _buidMessageItem(document)).toList(),
          );

        },
    );

  }




  //buold message item
  Widget _buidMessageItem(DocumentSnapshot document){
    Map<String ,dynamic> data =document.data() as Map<String, dynamic>;
    //align message to right if sender is current user,otherwise left
    var alignment=(data['senderId']==_firebaseAuth.currentUser!.uid) ?Alignment.centerRight :Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId']==_firebaseAuth.currentUser!.uid)?CrossAxisAlignment.end:CrossAxisAlignment.start,
           mainAxisAlignment:(data['senderId']==_firebaseAuth.currentUser!.uid)?MainAxisAlignment.end:MainAxisAlignment.start ,
            children: [
            Text(data['senderEmail']),
            SizedBox(height: 5,),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }




  //build message input
Widget _buildMessageInput(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(child: MyTextField(
              controller: _messageController,
              hintText: 'Enter Message',
              obsecureText: false),),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_forward,size: 40,))
        ],
      ),
    );
    
    
}






}
