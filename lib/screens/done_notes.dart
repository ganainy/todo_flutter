import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';
import 'package:todo_flutter/shared/reusable_components.dart';

class DoneNotes extends StatefulWidget {
  const DoneNotes({Key? key}) : super(key: key);

  @override
  _DoneNotesState createState() => _DoneNotesState();
}

class _DoneNotesState extends State<DoneNotes> {
  @override
  Widget build(BuildContext context) {
    var noteCubit = NoteCubit.get(context);
    //TODO: zbt amaken astd3a2 al initiatedb w getnotes
    noteCubit.getDoneNotes();
    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NoteItem(
                  note: noteCubit.doneNoteList.elementAt(index)['content'],
                  time: noteCubit.doneNoteList.elementAt(index)['time'],
                  date: noteCubit.doneNoteList.elementAt(index)['date'],
                  context: context,
                  noteId: noteCubit.doneNoteList.elementAt(index)['id']);
            },
            itemCount: noteCubit.doneNoteList.length,
          ),
        );
      },
    );
  }
}
