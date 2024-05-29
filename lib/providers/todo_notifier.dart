import 'package:flutter/material.dart';
import 'package:homework_45/controllers/todo_controller.dart';

class TodoNotifier extends InheritedWidget {
  final TodoController todoController;

  const TodoNotifier({
    super.key,
    required this.todoController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TodoNotifier oldWidget) {
    return oldWidget.todoController != todoController;
  }

  static TodoController of(BuildContext context) {
    final TodoNotifier? notifier =
        context.dependOnInheritedWidgetOfExactType<TodoNotifier>();
    if (notifier == null) {
      throw FlutterError(
          'TodoNotifier.of() called with a context that does not contain a TodoNotifier.');
    }
    return notifier.todoController;
  }
}

class NotesNotifier extends InheritedWidget {
  final NotesController notesController;

  const NotesNotifier({
    super.key,
    required this.notesController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant NotesNotifier oldWidget) {
    return oldWidget.notesController != notesController;
  }

  static NotesController of(BuildContext context) {
    final NotesNotifier? notifier =
        context.dependOnInheritedWidgetOfExactType<NotesNotifier>();
    if (notifier == null) {
      throw FlutterError(
          'NotesNotifier.of() called with a context that does not contain a NotesNotifier.');
    }
    return notifier.notesController;
  }
}
