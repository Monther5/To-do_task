import 'package:flutter/material.dart';
import 'package:todo_task/widgets/butten.dart';

// ignore: must_be_immutable
class Mydialog extends StatelessWidget {
  final Controller;
  VoidCallback onsave;
  VoidCallback oncancel;
   Mydialog({super.key,required this.Controller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:  Colors.deepPurple[200],
      content:Container(
      height: 150,
      child: Column(
        children: [
          TextField(
            controller:Controller ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "ADD Task",
          ),
          ),
          Row(
            children: [
              Mybutten(text: "save", onPressed: (onsave) 
                             

              , ),
              const SizedBox(width: 8,),
              Mybutten(text: "cancel", onPressed: (oncancel) 
             
              ,)

            ],
          )
        ],
      ),

      )
      );
  }
}