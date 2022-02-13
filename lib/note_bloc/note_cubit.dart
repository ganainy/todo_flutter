import 'dart:core';

import 'package:bloc/bloc.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState());

  void setDate(String? date) {
    emit(NoteState(date: date, time: state.time, note: state.note));
    print('date is set $date');
  }

  void setTime(String? time) {
    emit(NoteState(time: time, date: state.date, note: state.note));
    print('time is set $time');
  }

  void setNote(String? note) {
    emit(NoteState(note: note, date: state.date, time: state.time));
    print('note is set $note');
  }
}
