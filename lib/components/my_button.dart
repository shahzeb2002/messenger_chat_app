import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black ,
          borderRadius: BorderRadius.circular(12)
        ),child: Center(
        child: Text(text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,fontWeight: FontWeight.bold
        ),),
      ),
      ),
    );
  }
}
