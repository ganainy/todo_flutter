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
    noteCubit.getArchivedNotes();
    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return noteCubit.archivedNoteList.isEmpty
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No archived notes found',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.note_add_rounded)
                  ],
                ))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return NoteItem(
                      note: noteCubit.archivedNoteList
                          .elementAt(index)['content'],
                      time: noteCubit.archivedNoteList.elementAt(index)['time'],
                      date: noteCubit.archivedNoteList.elementAt(index)['date'],
                      context: context,
                      noteId:
                          noteCubit.archivedNoteList.elementAt(index)['id']);
                },
                itemCount: noteCubit.archivedNoteList.length,
              );
      },
    );
  }
}
