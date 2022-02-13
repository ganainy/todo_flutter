import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());

  var noteController = TextEditingController();
  var timeController = TextEditingController();

  var dateController = TextEditingController();

  get isBottomSheetShown => _isBottomSheetShown;

  set isBottomSheetShown(value) {
    _isBottomSheetShown = value;
    _fabIcon = _isBottomSheetShown ? Icon(Icons.done) : Icon(Icons.add);
    emit(NoteFabState());
    print('fab icon is set ');
  }

  get fabIcon => _fabIcon;
  var _date;
  var _time;
  var _note;
  var _isBottomSheetShown = false;
  var _fabIcon = const Icon(Icons.add);

  static NoteCubit get(context) => BlocProvider.of(context);

  void setDate(String? date) {
    _date = DateFormat("yyyy-MM-dd").format(DateTime.parse(date!));
    dateController.text = _date;
    emit(NoteCreateState());
    print('date is set $date');
  }

  void setTime(String? time) {
    _time = time;
    timeController.text = time ?? '';
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

  /* Icon getFabIcon() {
    emit(NoteFabState());
    print('fab icon is set ');
    return _isBottomSheetShown ? Icon(Icons.done) : Icon(Icons.add);
  }*/
}

class Note {
  String? note;
  String? time;
  String? date;

  Note(this.note, this.time, this.date);
}
