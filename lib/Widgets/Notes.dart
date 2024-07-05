import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Bloc/View_Note_Cubit/view_note_cubit.dart';
import 'package:notes_app/Models/NoteModel.dart';
import 'package:notes_app/Views/EditNotes.dart';

class Note_Widget extends StatelessWidget {
  const Note_Widget({super.key, required this.noteModel, required this.index});
  final int index;
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNote(),
          )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xffffcd7a),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 25, bottom: 20, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(noteModel.Title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500)),
                    IconButton(
                      onPressed: () {
                        Hive.box<NoteModel>("NotesBox").deleteAt(index);

                        BlocProvider.of<ViewNoteCubit>(context).ViewNotes();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 27,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "${noteModel.SubTitle}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 16.5,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    noteModel.Date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
