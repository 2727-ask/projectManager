import 'package:flutter/material.dart';

class Task{
  final String? id;
  final String? title;
  final String? state;
  Task({
   @required this.id,
   @required this.title,
   @required this.state,
  });
}