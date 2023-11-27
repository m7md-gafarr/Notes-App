import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TField(size: 1, LableText: "Title"),
              TField(size: 4, LableText: "LableText"),
              btn()
            ],
          ),
        ),
      ),
    );
  }
}

TextField TField({required int size, required String LableText}) {
  return TextField(
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

ElevatedButton btn() {
  return ElevatedButton(
    onPressed: () {},
    child: Text("SAVE", style: TextStyle(fontSize: 20)),
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        fixedSize: Size(double.maxFinite, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );
}
