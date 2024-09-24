import 'package:flutter/material.dart';
import 'package:todo_task/models/task_model.dart';
import 'package:todo_task/pages/task_detales.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onTap, required Null Function() onTapForCheck});
  final Taskmodel taskModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        Navigator.push(context,MaterialPageRoute(builder: (context)=>TaskDetailsScreen(taskModel: taskModel,))
    );},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                    ),
                    if (taskModel.subtitle != null)
                      Text(
                        taskModel.subtitle!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                      ),
                   
                  ],
                ),
                Checkbox(
                  value: taskModel.isCompleted,
                  onChanged: (check) {
                    onTap();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}