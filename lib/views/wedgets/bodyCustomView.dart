import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/views/wedgets/custom_appBar.dart';

import 'customListView.dart';
import 'custom_noteItem.dart';

class BodyCustmView extends StatefulWidget {
  const BodyCustmView({Key? key}) : super(key: key);

  @override
  State<BodyCustmView> createState() => _BodyCustmViewState();
}

class _BodyCustmViewState extends State<BodyCustmView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fitshAllNotes();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [

            CustomAppBar(title: 'Note',icon: Icons.search,),

          Expanded(child: NoteListView())
          ],
        ),
      ),
    );
  }
}




