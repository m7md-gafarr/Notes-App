import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Bloc/View_Note_Cubit/view_note_cubit.dart';
import 'package:notes_app/Models/NoteModel.dart';

import 'Notes.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<ViewNoteCubit>(context).ViewNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        List<NoteModel> note = BlocProvider.of<ViewNoteCubit>(context).notes!;
        return Expanded(
          child: ListView.builder(
            itemCount: note.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Note_Widget(
              index: index,
              noteModel: note[index],
            ),
          ),
        );
      },
    );
  }
}
