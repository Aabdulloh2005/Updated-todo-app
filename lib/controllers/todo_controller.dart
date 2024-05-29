import 'package:flutter/material.dart';
import 'package:homework_45/models/todo.dart';

class TodoController with ChangeNotifier {
  final List<TodoModel> _todoList = [
    TodoModel(title: "Running", date: "12:20", checkDone: false),
    TodoModel(title: "Exercise", date: "Tomorrow", checkDone: false),
    TodoModel(title: "Swimming", date: "4:00", checkDone: false),
  ];

  List<TodoModel> get todoList {
    return [..._todoList];
  }

  void deletePlan(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  void add(String name, String date) {
    _todoList.add(
      TodoModel(title: name, date: date, checkDone: false),
    );
    notifyListeners();
  }

  void editPlan(String title, String date, int index) {
    _todoList[index].title = title;
    _todoList[index].date = date;
    notifyListeners();
  }

  void toggleDone(int index) {
    _todoList[index].checkDone = !_todoList[index].checkDone;
    notifyListeners();
  }

  int counter() {
    int counter = 0;
    for (var i in _todoList) {
      if (!i.checkDone) {
        counter++;
      }
    }
    notifyListeners();
    return counter;
  }
}

class NotesController with ChangeNotifier {
  final List<NotesModel> _notesList = [
    NotesModel(
        title: "Running",
        subtitle:
            "Pariatur labore magna enim dolor non occaecat irure et nulla magna sunt enim."),
    NotesModel(
        title: "Exercise", subtitle: "Laboris et et et et exercitation magna."),
    NotesModel(title: "Swimming", subtitle: "Ut ad ad proident adipisicing."),
  ];

  List<NotesModel> get notesList {
    return [..._notesList];
  }

  void deletePlan(int index) {
    _notesList.removeAt(index);
    notifyListeners();
  }
}
