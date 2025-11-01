import 'package:chat_messenger_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier{

  //instance of auth and fire store
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(String receiverId,String message)async{
  //getting current user info
    final String currenUserId=_firebaseAuth.currentUser!.uid;
    final String currentUserEmail=_firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp=Timestamp.now();

    //creating new message
    Message newMessage=Message(
        senderId: currenUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp
    );

    //construciting chat id from current user id and reciver id
    List<String> ids=[currenUserId,receiverId];
    ids.sort();//to ensure chat rooom id is always same for for pair
    String chatRoomId=ids.join('_');//combining id into single string to use as chatroomid

    //adding new message to db
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userId,String otherUserId){
    List<String> ids=[userId,otherUserId];
    ids.sort();
    String chatRoomId=ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp',descending: false)
        .snapshots();
  }


}