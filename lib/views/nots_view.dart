import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/cubits/notes/notsState.dart';
import 'package:notsapp/views/wedgets/AddNote.dart';
import 'package:notsapp/views/wedgets/bodyCustomView.dart';

class nots_view extends StatelessWidget {
  const nots_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,

        onPressed: (){

        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          context: context, builder: (context) {

          return AddNote();
        },);
      },child: Icon(Icons.add),),
      body: BodyCustmView()
    );
  }
}


