import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notsapp/cubits/AddNoteCubit/Add_Note_States.dart';
import 'package:notsapp/cubits/AddNoteCubit/addNoteCubit.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/views/wedgets/customButton.dart';
import 'package:notsapp/views/wedgets/customTextField.dart';

import 'formNote.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

final bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(AddNoteinitiallState()),
      child: BlocConsumer<AddNoteCubit,AddNoteStates>(
        listener: (context,state){

           if(state is AddNoteSuccessState){
             BlocProvider.of<NoteCubit>(context).fitshAllNotes();
            Navigator.pop(context);

          }
        },
        builder: (context,state){
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState?true:false,

              child: Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: NoteForm()),
              ));
        }

      ),
    );
  }
}

