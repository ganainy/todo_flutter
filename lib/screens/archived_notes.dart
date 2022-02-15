import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';
import 'package:todo_flutter/shared/reusable_components.dart';

class ArchivedNotes extends StatefulWidget {
  const ArchivedNotes({Key? key}) : super(key: key);

  @override
  _ArchivedNotesState createState() => _ArchivedNotesState();
}

class _ArchivedNotesState extends State<ArchivedNotes> {
  @override
  Widget build(BuildContext context) {
    var noteCubit = NoteCubit.get(context);
    //TODO: zbt amaken astd3a2 al initiatedb w getnotes
    noteCubit.getArchivedNotes();
    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NoteItem(
                  note: noteCubit.archivedNoteList.elementAt(index)['content'],
                  time: noteCubit.archivedNoteList.elementAt(index)['time'],
                  date: noteCubit.archivedNoteList.elementAt(index)['date'],
                  context: context,
                  noteId: noteCubit.archivedNoteList.elementAt(index)['id']);
            },
            itemCount: noteCubit.archivedNoteList.length,
          ),
        );
      },
    );
  }
}
