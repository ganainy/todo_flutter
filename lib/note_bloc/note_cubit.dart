import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());

  var _date;
  var _time;
  var _note;

  static NoteCubit get(context) => BlocProvider.of(context);

  void setDate(String? date) {
    _date = date;
    emit(NoteCreateState());
    print('date is set $date');
  }

  void setTime(String? time) {
    _time = time;
    emit(NoteCreateState());
    print('time is set $time');
  }

  void setNote(String? note) {
    _note = note;
    emit(NoteCreateState());
    print('note is set $note');
  }

  Note getNote() {
    return Note(_note, _time, _date);
  }
}

class Note {
  String? note;
  String? time;
  String? date;

  Note(this.note, this.time, this.date);
}
