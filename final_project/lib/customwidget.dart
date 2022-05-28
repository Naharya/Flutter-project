import 'package:final_project/models/note.dart';
import 'package:flutter/material.dart';
import 'package:final_project/db.dart';

class NoteWidgrt extends StatefulWidget {
  const NoteWidgrt({Key? key}) : super(key: key);

  @override
  State<NoteWidgrt> createState() => _NoteWidgrtState();
}

class _NoteWidgrtState extends State<NoteWidgrt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: DBHelper.dbHelper.allNotes.length,
          itemBuilder: (context, x) {
            return NoteWidgrt();
          }),
    );
  }
}
