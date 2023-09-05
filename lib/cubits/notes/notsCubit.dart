import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notsapp/cubits/notes/notsState.dart';

import '../../constants.dart';
import '../../models/noteModel.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteinitiallState());

  List<NoteModel> ?notes;

  fitshAllNotes() async {

    var NoteBox = Hive.box<NoteModel>(kbox_note);
    notes = NoteBox.values.toList();
    emit(NoteSuccessState());
  }
}
