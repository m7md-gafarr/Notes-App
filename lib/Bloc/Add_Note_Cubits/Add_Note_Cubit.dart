import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Models/NoteModel.dart';

import 'Add_Note_State.dart';

class AddNoteCubit extends Cubit<Add_Note_State> {
  AddNoteCubit() : super(AddNoteInit());

  AddNote(NoteModel notemodel) async {
    emit(AddNoteLoding());
    try {
      var noteBox = Hive.box<NoteModel>("NotesBox");
      await noteBox.add(notemodel);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailer(e.toString()));
    }
  }
}
