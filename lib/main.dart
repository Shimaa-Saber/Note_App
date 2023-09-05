import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notsapp/blockOpserver/simbleBlockOpserver.dart';
import 'package:notsapp/cubits/AddNoteCubit/Add_Note_States.dart';
import 'package:notsapp/cubits/AddNoteCubit/addNoteCubit.dart';
import 'package:notsapp/cubits/notes/notsCubit.dart';
import 'package:notsapp/models/noteModel.dart';
import 'package:notsapp/views/nots_view.dart';

import 'constants.dart';

void main() async{

 await Hive.initFlutter();
 Bloc.observer=simbleBlockObserver();
 Hive.registerAdapter(NoteModelAdapter());
 await Hive.openBox<NoteModel>(kbox_note);



  runApp( Nots_App());
}

class Nots_App extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            brightness: Brightness.dark),
        home:nots_view()

      ),
    );
  }
}
