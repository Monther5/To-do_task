import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/models/task_model.dart';
class TasksProvider with ChangeNotifier {
  List<Taskmodel> tasks = [];

  addTask(Taskmodel tm) {
    tasks.add(tm);
    storeTasks();
    notifyListeners();
  }

  delete(Taskmodel tm) {
    tasks.remove(tm);
    storeTasks();
    notifyListeners();
  }
  edit(Taskmodel tm, Taskmodel oldTm) {
    tasks.remove(oldTm);
    tasks.add(tm);
    storeTasks();
    notifyListeners();
  }
  switchValue(Taskmodel tm) {
tm.
    isCompleted = !tm.isCompleted;
    storeTasks();
    notifyListeners();
  }
  storeTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = jsonEncode(tasks.map((Taskmodel) => Taskmodel.toJson()).toList());

    if (kDebugMode) {
      print("JSON FROM STORE $json");
    }
    prefs.setString("tasks", json);
    getTasks();
  }
  getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("tasks");
    if (kDebugMode) {
      print("JSON FROM GET $data");
    }
    if (data != null) {
      tasks = List<Taskmodel>.from(
        jsonDecode(data).map((x) => Taskmodel.fromJson(x)),
      );
      notifyListeners();
    }
  }

  void switchState(Taskmodel task) {}
}