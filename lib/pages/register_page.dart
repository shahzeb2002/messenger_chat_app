import 'package:chat_messenger_app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();

  //sign up
  void signUp() async{
    if(passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords dont match")));
      return;
    }

    final  authService= Provider.of<AuthService>(context,listen: false);
    try{
      await authService.signUpWithEmailandPassword(emailController.text, passwordController.text);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
      
    }





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                //logo
                Icon(Icons.message,size: 100,),
                const SizedBox(height: 50,),


                //account
                Text('Lets Create an Account',style: TextStyle(fontSize: 16),),

                const SizedBox(height: 25,),

                //email
                MyTextField(
                    controller: emailController,
                    hintText: 'email',
                    obsecureText: false
                ),
                const SizedBox(height: 10,),
                //psss
                MyTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obsecureText: true
                ),
                const SizedBox(height: 10,),

                //confirm pass
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'confirm password',
                    obsecureText: true
                ),
                const SizedBox(height: 25,),

                //sign up button
                MyButton(text: 'Sign Up', onTap:signUp,),
                //register
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a Member'),
                    SizedBox(width: 4,),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Login Now',style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
