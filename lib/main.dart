import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Views/NotesView.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: NotesView(),
      ),
    );
  }
}
