import 'package:chat_messenger_app/components/my_button.dart';
import 'package:chat_messenger_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void signIn(){}

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


                //welcome back
                Text('welocome',style: TextStyle(fontSize: 16),),

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
                    hintText: 'pass',
                    obsecureText: true
                ),
                const SizedBox(height: 25,),

                //sign in button
                MyButton(text: 'Login', onTap:signIn,),
                //register
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a Member'),
                    SizedBox(width: 4,),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Register Now',style: TextStyle(fontWeight: FontWeight.bold),))
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
