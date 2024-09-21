import 'package:flutter/material.dart';
import 'package:todo_task/widgets/dialog.dart';
import 'package:todo_task/widgets/task_card.dart';

class homepage extends StatefulWidget {
  const homepage({super.key,});

  @override
  State<homepage> createState() => _homepageState();
 
}

class _homepageState extends State<homepage> {
  final _controller =TextEditingController();
  List task=[

    ["Go To The Gym",false],
   ["Go To The Home",false],

  ];
  void ChakBoxstate(bool value,int index){
    setState(() {
      task [index][1]=!task[index][1];
    });
  }
  void savetext(){
    setState(() {
      task.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop;
  }
  void delettask(int index){
    setState(() {
      task.removeAt(index);
    }
      );
  }
  void showdilog (){
    showDialog(
      context:context,
      builder: (context) {
        return Mydialog(Controller: _controller, onsave:savetext, oncancel:() => Navigator.of(context).pop,);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Center(child: Text('TO DO TASK')),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(onPressed: showdilog,
      child: Icon(Icons.add),

      ),
      body:ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return TaskCard(
      taskName:   task[index][0],
       isCompleted: task[index][1],
      onChanged: (value) => ChakBoxstate(value!, index), 
      delete: (context)=>delettask(index), 
          );
        },
        
        )
      );
      
      
      
  
      
    

    
  }
}