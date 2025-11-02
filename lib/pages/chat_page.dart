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
        automaticallyImplyLeading: true,
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: Icon(Icons.person,color: Colors.grey,),),
        // ),
        titleSpacing: -10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person,color: Colors.grey,),),
            SizedBox(width: 5,),
            Expanded(child: Text(widget.receiveuserEmail,style: TextStyle(color: Colors.grey.shade800),)),



          ]
        ),
        actions: [
          Icon(Icons.call,size: 28,),
          SizedBox(width: 10,),
          Icon(Icons.video_call,size: 35,),
          SizedBox(width: 10,),
          Icon(Icons.info,size: 30,),
          SizedBox(width: 10,)
        ],

      ),
      body: Column(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.grey,child: Icon(Icons.person,size: 50,color: Colors.white,),),
              SizedBox(height: 10,),
              Text("you're friends on chatbubble",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade600),)

            ],
          ),


          //messages
          Expanded(child: _buildMessageList(),
          ),
          //userinput
          _buildMessageInput(),
          // SizedBox(height: 5,)



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
    var bgcolor=(data['senderId']==_firebaseAuth.currentUser!.uid) ?Colors.grey.shade800 :Colors.grey;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId']==_firebaseAuth.currentUser!.uid)?CrossAxisAlignment.end:CrossAxisAlignment.start,
           mainAxisAlignment:(data['senderId']==_firebaseAuth.currentUser!.uid)?MainAxisAlignment.end:MainAxisAlignment.start ,
            children: [
            Text(data['senderEmail'],style: TextStyle(color: Colors.grey.shade600),),
            SizedBox(height: 5,),
            ChatBubble(message: data['message'], bgcolor: bgcolor)
          ],
        ),
      ),
    );
  }




  //build message input
Widget _buildMessageInput(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5))

      ),
      child: Row(
        children: [
          SizedBox(width: 8,),

          Icon(Icons.grid_view_rounded),
          SizedBox(width: 8,),
          Icon(Icons.camera),
          SizedBox(width: 8,),

          Icon(Icons.insert_photo_rounded),
          SizedBox(width: 8,),

          Icon(Icons.mic),
          SizedBox(width: 8,),

          Expanded(child: MyTextField(
              controller: _messageController,
              hintText: 'Enter Message',
              obsecureText: false),),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_forward,size: 30,))
        ],
      ),
    );
}
}
