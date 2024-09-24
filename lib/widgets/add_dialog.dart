import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({
    super.key,
    required this.titleController,
    required this.subTitleController,
     this.formKey,
    required this.onTap,
  });

  final TextEditingController titleController;
  final TextEditingController subTitleController;
  final GlobalKey<FormState> ?formKey;
  final Function onTap;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: widget.titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Enter Task Title";
                  }
                  if (value.length < 5) {
                    return " Enter Valid Task Title";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Title ",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Subtitle ",
                  border: OutlineInputBorder(),
                ),
                controller: widget.subTitleController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.titleController.clear();
                      widget.subTitleController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                   if (widget.titleController.text.isEmpty) {
                        widget.onTap();
                      }
                    },
                    child: const Text("ADD"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}