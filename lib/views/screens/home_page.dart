import 'package:flutter/material.dart';
import 'package:homework_45/providers/todo_notifier.dart';
import 'package:homework_45/views/widgets/add_dialog.dart';
import 'package:homework_45/views/widgets/notes_widgets.dart';
import 'package:homework_45/views/widgets/plan_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: pageCount == 0 ? const Text("Todo") : const Text("Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          onPageChanged: (value) {
            pageCount = value;
            setState(() {});
          },
          children: [
            Column(
              children: [
                Expanded(
                  child: ListenableBuilder(
                    listenable: TodoNotifier.of(context),
                    builder: (context, child) {
                      return ListView.builder(
                        itemCount: TodoNotifier.of(context).todoList.length,
                        itemBuilder: (context, i) {
                          return PlanWidget(
                            i: i,
                            model: TodoNotifier.of(context).todoList[i],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListenableBuilder(
                    listenable: NotesNotifier.of(context),
                    builder: (context, child) {
                      return ListView.builder(
                        itemCount: NotesNotifier.of(context).notesList.length,
                        itemBuilder: (context, i) {
                          return NotesWidgets(
                            i: i,
                            model: NotesNotifier.of(context).notesList[i],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) {
              return const AddDialog();
            },
          );
          if (data != null) {
            TodoNotifier.of(context).add(data['title'], data['date']);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
