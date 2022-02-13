import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';
import 'package:todo_flutter/shared/reusable_components.dart';

class NewNotes extends StatefulWidget {
  const NewNotes({Key? key}) : super(key: key);

  @override
  _NewNotesState createState() => _NewNotesState();
}

class _NewNotesState extends State<NewNotes> {
  @override
  Widget build(BuildContext context) {
    var noteCubit = NoteCubit.get(context);
    //TODO: zbt amaken astd3a2 al initiatedb w getnotes
    noteCubit.getNotes();
    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NoteItem(
                  note: noteCubit.noteList.elementAt(index)['content'],
                  time: noteCubit.noteList.elementAt(index)['time'],
                  date: noteCubit.noteList.elementAt(index)['date']);
            },
            itemCount: noteCubit.noteList.length,
          ),
        );
      },
    );
  }
}
