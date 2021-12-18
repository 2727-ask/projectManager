// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'Task.dart';
import 'card.dart';

class ColumnForTasks extends StatefulWidget {
  String? columnName;
  Color? columnColor;
  IconData? columnIcon;
  Color? headerColor;
  List<Task>? tasks;
  ColumnForTasks(
      {Key? key,
      this.columnName,
      this.tasks,
      this.columnColor,
      this.columnIcon,
      this.headerColor})
      : super(key: key);

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.columnName.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(widget.columnIcon)
                ],
              ),
              padding: const EdgeInsets.all(20),
              width: 300,
              color: widget.headerColor,
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
