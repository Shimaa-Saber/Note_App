abstract class AddNoteStates{}

class AddNoteinitiallState extends AddNoteStates{}
class AddNoteLoadingState extends AddNoteStates{}
class AddNoteSuccessState extends AddNoteStates{}
class AddNoteFauilarState extends AddNoteStates{
  final String errorMessage;

  AddNoteFauilarState(this.errorMessage);
}

