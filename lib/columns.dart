// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'Task.dart';
import 'card.dart';

class ColumnForTasks extends StatefulWidget {
  List<Task>? tasks;
  ColumnForTasks({Key? key, this.tasks}) : super(key: key);

  @override
  _ColumnForTasksState createState() => _ColumnForTasksState();
}

class _ColumnForTasksState extends State<ColumnForTasks> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
