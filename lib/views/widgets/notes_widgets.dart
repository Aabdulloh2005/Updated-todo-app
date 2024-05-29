import 'package:flutter/material.dart';
import 'package:homework_45/models/todo.dart';
import 'package:homework_45/providers/todo_notifier.dart';
import 'package:homework_45/views/widgets/delete_dialog.dart';

class NotesWidgets extends StatelessWidget {
  final NotesModel model;
  final int i;

  const NotesWidgets({
    required this.model,
    required this.i,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          model.title,
          style: TextStyle(
            decorationColor: Colors.black,
            decorationThickness: 2,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(model.subtitle),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DeleteDialog(index: i, isNote: true);
              },
            );
          },
        ),
      ),
    );
  }
}
