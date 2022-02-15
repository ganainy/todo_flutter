part of 'note_cubit.dart';

abstract class NoteStates {}

class NoteInitialState extends NoteStates {}

class NoteCreateState extends NoteStates {}

class NoteFabState extends NoteStates {}

class NewNotesState extends NoteStates {}

class ArchivedNotesState extends NoteStates {}

class DoneNotesState extends NoteStates {}

class BottomNavState extends NoteStates {}

class NoteUpdateState extends NoteStates {}

class NoteDeleteState extends NoteStates {}
