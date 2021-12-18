// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp/columns.dart';

import 'Task.dart';

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class Data {
  final String title = 'Hello';
}

class _BoardState extends State<Board> {
  bool successfulDrop = false;
  Map<String, List<Task>> cols = {
    'firstColumn': [
      Task(id: 'c1', title: 'Column 1', state: 'firstColumn'),
      Task(id: 't1', title: 'Task 1', state: 'firstColumn'),
      Task(id: 't2', title: 'Task 2', state: 'firstColumn'),
      Task(id: 't3', title: 'Task 3', state: 'firstColumn'),
    ],
    'secondColumn': [
      Task(id: 'c2', title: 'Column 2', state: 'secondColumn'),
    ],
    'thirdColumn': [
      Task(id: 'c3', title: 'Column 3', state: 'thirdColumn'),
      Task(id: 't4', title: 'Task 4', state: 'thirdColumn'),
      Task(id: 't5', title: 'Task 5', state: 'thirdColumn'),
    ],
    'fourthColumn': [
      Task(id: 'c4', title: 'Column 4', state: 'fourthColumn'),
    ]
  };

  void addTask({data, presentCol}) {
    String taskCameFrom = data.state.toString();
    for (var tasks in cols[taskCameFrom]!) {
      if (tasks.id == data.id) {
        print(taskCameFrom);
        Task newTask = Task(id: data.id, title: data.title, state: presentCol);
        setState(() {
          cols[presentCol]!.add(newTask);
          cols[taskCameFrom]!.remove(data);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DragTarget<Task>(
                  builder: (context, data, rejectedData) {
                    return Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ColumnForTasks(
                          columnName: 'Todo',
                          tasks: cols['firstColumn'],
                          columnColor: Colors.deepOrange[50],
                          headerColor: Colors.redAccent[700],
                          columnIcon: Icons.add_circle_outline_rounded),
                    );
                  },
                  onWillAccept: (data) {
                    print("On Accept triggered");
                    return true;
                  },
                  onAccept: (data) {
                    print("On Accept triggered");
                    addTask(
                      data: data,
                      presentCol: 'firstColumn',
                    );
                  },
                ),
                DragTarget<Task>(
                  builder: (context, List data, List rejectedData) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey)),
                      child: ColumnForTasks(
                          columnName: 'Doing',
                          tasks: cols['secondColumn'],
                          columnColor: Colors.pink[50],
                          headerColor: Colors.purpleAccent[700],
                          columnIcon: Icons.construction_rounded),
                    );
                  },
                  onWillAccept: (data) {
                    print(data);
                    return true;
                  },
                  onAccept: (data) {
                    print("On Accept triggered");
                    addTask(data: data, presentCol: 'secondColumn');
                  },
                ),
                DragTarget<Task>(
                  builder: (context, List data, List rejectedData) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                      ),
                      child: ColumnForTasks(
                        columnName: 'Review',
                        tasks: cols['thirdColumn'],
                        columnColor: Colors.blue[50],
                        headerColor: Colors.blueAccent[700],
                        columnIcon: Icons.reviews_outlined,
                      ),
                    );
                  },
                  onWillAccept: (data) {
                    print(data);
                    return true;
                  },
                  onAccept: (data) {
                    print("On Accept triggered");
                    addTask(data: data, presentCol: 'thirdColumn');
                  },
                ),
                DragTarget<Task>(
                  builder: (context, List data, List rejectedData) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                      ),
                      child: ColumnForTasks(
                        columnName: 'Done',
                        tasks: cols['fourthColumn'],
                        columnColor: Colors.green[50],
                        headerColor: Colors.greenAccent[700],
                        columnIcon: Icons.done_outline_rounded,
                      ),
                    );
                  },
                  onWillAccept: (data) {
                    print(data);
                    return true;
                  },
                  onAccept: (data) {
                    print("On Accept triggered");
                    addTask(data: data, presentCol: 'fourthColumn');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
