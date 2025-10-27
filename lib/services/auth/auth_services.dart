
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //instance of auth to check wheter we are logged in
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  //sign in
Future<UserCredential> signInWithEmailandPassword(String email,String password) async{
  try{
    UserCredential userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}


//sign out




}