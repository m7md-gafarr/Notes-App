import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Models/NoteModel.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
  List<NoteModel>? notes;
  ViewNotes() {
    Box<NoteModel> noteBox = Hive.box<NoteModel>("NotesBox");
    notes = noteBox.values.toList();
    emit(ViewNoteSuccess());
  }
}
