import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/AddNoteCubit/Add_Note_States.dart';
import 'package:notsapp/cubits/AddNoteCubit/addNoteCubit.dart';
import 'package:notsapp/views/wedgets/colorListView.dart';

import '../../models/noteModel.dart';
import 'customButton.dart';
import 'customTextField.dart';

class NoteForm extends StatefulWidget {
  NoteForm({
    Key? key,
  }) : super(key: key);


  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String ?subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(

        children: [
          SizedBox(height: 35,),
          CustomTextFiled(
            onsaved: (value) {
              title = value;
            },
            hint: 'title',),
          SizedBox(height: 16,),
          CustomTextFiled(
            onsaved: (value) {
              subtitle = value;
            },

            hint: 'Content', maxlines: 5,),

         SizedBox(height: 20,),

         ColorList(),


          SizedBox(height: 20,),
          BlocBuilder<AddNoteCubit,AddNoteStates>(
            builder: (context, state) =>
            CustomButton(
              isLoading: state is AddNoteLoadingState?true:false,
              ontap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                   NoteModel note=NoteModel(title: title!, subTitle: subtitle!, date: DateTime.now().toString(), color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(note);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
            ),
          ),
          SizedBox(height: 20,),


        ],
      ),
    );
  }
}

