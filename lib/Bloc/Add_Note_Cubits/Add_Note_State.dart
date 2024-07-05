abstract class Add_Note_State {}

class AddNoteInit extends Add_Note_State {}

class AddNoteLoding extends Add_Note_State {}

class AddNoteSuccess extends Add_Note_State {}

class AddNoteFailer extends Add_Note_State {
  final String ErrorMessage;
  AddNoteFailer(this.ErrorMessage);
}
