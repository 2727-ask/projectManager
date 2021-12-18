// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  String? title;
  TaskCard({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Text(title.toString()),
        width: 300,
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
