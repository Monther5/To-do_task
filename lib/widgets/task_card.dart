// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatelessWidget {
   TaskCard({super.key,
  required this.taskName,
  required this.onChanged, 
  required this.delete,
  required this.isCompleted});

 final String taskName;
 final bool  isCompleted ;
 final  Function (bool?)?onChanged;
 Function (BuildContext)delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (delete) ,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
           decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
            Checkbox(value: isCompleted, onChanged: onChanged,
            activeColor: Colors.black,),
            
              
            Text(taskName,style: TextStyle(decoration:isCompleted? TextDecoration.lineThrough:TextDecoration.none),)
         
            ],
          
        
          )
        ),
      ),
    );
  }
}