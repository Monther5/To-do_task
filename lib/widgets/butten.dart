import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybutten
 extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   Mybutten
  ({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.deepPurple[300],
      child: Text(text)
    );
  }
}