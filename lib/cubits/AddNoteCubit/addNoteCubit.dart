import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notsapp/constants.dart';
import 'package:notsapp/cubits/AddNoteCubit/Add_Note_States.dart';
import 'package:notsapp/models/noteModel.dart';

class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit(AddNoteStates initialState) : super(initialState);
  Color color= Color(0xffCECE5A);
  addNote(NoteModel note)async{
    note.color=color.value;
    emit(AddNoteLoadingState());
   try{
     var NoteBox=Hive.box<NoteModel>(kbox_note);
     await NoteBox.add(note);
     emit(AddNoteSuccessState());

   }catch(e){
     emit(AddNoteFauilarState(e.toString()));
   }
  }

}