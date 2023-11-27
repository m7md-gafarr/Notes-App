import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/AddNote.dart';
import 'package:notes_app/Widgets/AppBar.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 13, right: 13),
        child: Column(
          children: [
            AppBar_Widget(Titel: "Edit Note", icon: Icon(Icons.done, size: 25)),
            SizedBox(
              height: 50,
            ),
            TField(size: 1, LableText: "Title"),
            SizedBox(
              height: 20,
            ),
            TField(size: 5, LableText: "Content"),
          ],
        ),
      ),
    );
  }
}
