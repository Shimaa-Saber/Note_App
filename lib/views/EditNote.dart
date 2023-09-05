import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notsapp/models/noteModel.dart';
import 'package:notsapp/views/wedgets/CustomEditNote.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEditNote(note: note,),
    );
  }
}
