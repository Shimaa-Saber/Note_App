import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/cubits/notes/notsState.dart';
import 'package:notsapp/models/noteModel.dart';

import 'custom_noteItem.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NoteCubit,NoteStates>(
      builder: (context, state) {
        List<NoteModel>notes=BlocProvider.of<NoteCubit>(context).notes!;
        return  ListView.builder(
          itemCount: notes.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
        return   Padding(
        padding:  EdgeInsets.symmetric(vertical: 4),
        child: nots_item(
          note: notes[index]
        ),
        );
        },);
      },

    );
  }
}