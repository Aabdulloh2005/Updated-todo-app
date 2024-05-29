import 'package:flutter/material.dart';
import 'package:homework_45/controllers/todo_controller.dart';
import 'package:homework_45/providers/todo_notifier.dart';
import 'package:homework_45/views/screens/home_page.dart';

void main(List<String> args) {
  runApp(MainRunner());
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return NotesNotifier(
      notesController: NotesController(),
      child: TodoNotifier(
        todoController: TodoController(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
