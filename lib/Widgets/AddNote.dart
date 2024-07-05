import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Bloc/Add_Note_Cubits/Add_Note_Cubit.dart';
import 'package:notes_app/Bloc/Add_Note_Cubits/Add_Note_State.dart';
import 'package:notes_app/Bloc/View_Note_Cubit/view_note_cubit.dart';
import 'package:notes_app/Models/NoteModel.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => AddNoteCubit(),
            child: BlocConsumer<AddNoteCubit, Add_Note_State>(
              listener: (context, state) {
                if (state is AddNoteSuccess) {
                  Navigator.pop(context);
                }
                if (state is AddNoteFailer) {
                  SnackBar(content: Text(" Somting Error"));
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is AddNoteLoding ? true : false,
                  child: AddNoteForm(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> fromkey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TField(
            size: 1,
            LableText: "Title",
            onSaved: (p0) {
              title = p0;
            },
          ),
          TField(
            size: 4,
            LableText: "Content",
            onSaved: (p0) {
              subTitle = p0;
            },
          ),
          btn(fun: () {
            if (fromkey.currentState!.validate()) {
              fromkey.currentState!.save();

              BlocProvider.of<AddNoteCubit>(context).AddNote(
                NoteModel(
                  Title: title!,
                  SubTitle: subTitle!,
                  Date: DateFormat.yMd().format(DateTime.now()).toString(),
                  color: Colors.blue.value,
                ),
              );
              BlocProvider.of<ViewNoteCubit>(context).ViewNotes();
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          })
        ],
      ),
    );
  }
}

TextFormField TField(
    {required int size,
    required String LableText,
    void Function(String?)? onSaved}) {
  return TextFormField(
    onSaved: onSaved,
    validator: (value) {
      if (value?.isEmpty ?? true) {
        return "Enter Value.";
      } else
        return null;
    },
    maxLines: size,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: LableText,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    ),
  );
}

ElevatedButton btn({required Function() fun}) {
  return ElevatedButton(
    onPressed: fun,
    child: Text(
      "SAVE",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        fixedSize: Size(double.maxFinite, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );
}
