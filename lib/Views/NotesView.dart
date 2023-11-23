import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/AppBar.dart';
import 'package:notes_app/Widgets/Notes.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

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
                AppBar_Widget(),
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
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white.withOpacity(1),
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Note_Widget(),
      ),
    );
  }
}
