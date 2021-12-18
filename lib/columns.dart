// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'Task.dart';
import 'card.dart';

class ColumnForTasks extends StatefulWidget {
  String? columnName;
  Color? columnColor;
  List<Task>? tasks;
  ColumnForTasks({Key? key, this.columnName, this.tasks,this.columnColor}) : super(key: key);

  @override
  _ColumnForTasksState createState() => _ColumnForTasksState();
}

class _ColumnForTasksState extends State<ColumnForTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.columnColor,
      child: Column(
        children: [
          Card(
            child: Container(
              child: Text(widget.columnName.toString()),
              padding: const EdgeInsets.all(20),
              width: 300,
              color: Colors.amber,
            ),
          ),
          Column(
            children: widget.tasks!.map((e) {
              return Draggable(
                child: TaskCard(
                  title: e.title,
                ),
                feedback: TaskCard(
                  title: e.title,
                ),
                childWhenDragging: TaskCard(
                  title: e.title,
                ),
                data: e,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
