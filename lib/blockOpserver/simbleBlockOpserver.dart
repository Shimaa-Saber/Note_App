import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class simbleBlockObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
   debugPrint('change $change' );
  }

  @override
  void onClose(BlocBase bloc) {
   print('colse  $bloc');}

  @override
  void onCreate(BlocBase bloc) {
    print('create $bloc');

  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }

}