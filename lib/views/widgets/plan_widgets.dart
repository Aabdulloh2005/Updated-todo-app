import 'package:flutter/material.dart';
import 'package:homework_45/models/todo.dart';
import 'package:homework_45/providers/todo_notifier.dart';
import 'package:homework_45/views/widgets/add_dialog.dart';
import 'package:homework_45/views/widgets/delete_dialog.dart';

class PlanWidget extends StatelessWidget {
  final TodoModel model;
  final int i;
  const PlanWidget({required this.model, required this.i, super.key});

  @override
  Widget build(BuildContext context) {
    void onDone(int i) {
      TodoNotifier.of(context).toggleDone(i);
    }

    void onEdited(String title, String date, int i) {
      TodoNotifier.of(context).editPlan(title, date, i);
    }

    return Card(
      elevation: 2,
      child: ListTile(
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => onDone(i),
          child: model.checkDone
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.radio_button_off,
                  color: Colors.grey,
                ),
        ),
        title: Text(
          model.title,
          style: TextStyle(
            decoration: model.checkDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 2,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: model.checkDone ? Colors.grey.shade600 : null,
          ),
        ),
        subtitle: Text(
          model.date,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                final data = await showDialog<Map<String, dynamic>>(
                  context: context,
                  builder: (context) {
                    return AddDialog(model: model);
                  },
                );
                if (data != null) {
                  onEdited(data["title"], data["date"], i);
                }
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(index: i);
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
