import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/AddNote.dart';
import 'package:notes_app/Widgets/AppBar.dart';

import '../Widgets/NotesListView.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 13, right: 13),
            child: Column(
              children: [
                // AppBar
                AppBar_Widget(
                  Titel: "Notes",
                  icon: Icon(Icons.search, size: 25),
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                //Notes View
                NotesListView()
                //
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: AddNote(),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.brown[700],
      ),
    );
  }
}
