
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier{
  //instance of auth to check wheter we are logged in
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  //instance of firestore db
  final FirebaseFirestore _fireStore=FirebaseFirestore.instance;



  //sign in---------------------------------------------
Future<UserCredential> signInWithEmailandPassword(String email,String password) async{
  try{
    UserCredential userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    //add new document for user in user collections if it doesnt exist
    _fireStore.collection('users').doc(userCredential.user!.uid).set({
      'uid':userCredential.user!.uid,
      'email':email,
    },SetOptions(merge: true));

    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}
//singn up create a user-------------------------------------
  Future<UserCredential> signUpWithEmailandPassword(String email, password) async{
  try{
    UserCredential userCredential =await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    //creating new document for user in user collections,when he sign in
    _fireStore.collection('users').doc(userCredential.user!.uid).set({
      'uid':userCredential.user!.uid,
      'email':email
    });
    
    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }

  }





//sign out----------------------------------------------------

Future<void> signOut()async {
  return await FirebaseAuth.instance.signOut();
}




}