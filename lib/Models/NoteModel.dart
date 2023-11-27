import 'package:flutter/material.dart';

class NoteModel {
  final String Title;
  final String SubTitle;
  final DateTime Date;
  final Color color;

  const NoteModel({
    required this.Title,
    required this.SubTitle,
    required this.Date,
    required this.color,
  });
}
