import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/models/noteModel.dart';
import 'package:notsapp/views/wedgets/customTextField.dart';
import 'package:notsapp/views/wedgets/custom_appBar.dart';
import 'package:notsapp/views/wedgets/editNoteColorList.dart';

class CustomEditNote extends StatefulWidget {
   CustomEditNote({Key? key, required this.note,}) : super(key: key);
final NoteModel note;


  @override
  State<CustomEditNote> createState() => _CustomEditNoteState();
}

class _CustomEditNoteState extends State<CustomEditNote> {
  String ?title;
  String ?subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        children: [

          CustomAppBar(icon: Icons.check,title: 'Edit Note',
              onPressed: (){

            widget.note.title=title??widget.note.title;
            widget.note.subTitle=subTitle??widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NoteCubit>(context).fitshAllNotes();
            Navigator.pop(context);

          }),
          SizedBox(height: 30,),

          CustomTextFiled(hint: 'title',onchanged: (data){
            title=data;
          }),
          SizedBox(height: 20,),
          CustomTextFiled(hint: 'Content',maxlines: 5,onchanged: (data){
            subTitle=data;
          },),
          SizedBox(height: 20,),
          editNoteColorList(note: widget.note)
          
        ],
      ),
    );
  }
}
