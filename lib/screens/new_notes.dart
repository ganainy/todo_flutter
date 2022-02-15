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
    noteCubit.getNewNotes();
    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(child: (() {
          if (noteCubit.newNoteList.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NoteItem(
                    note: noteCubit.newNoteList.elementAt(index)['content'],
                    time: noteCubit.newNoteList.elementAt(index)['time'],
                    date: noteCubit.newNoteList.elementAt(index)['date'],
                    context: context,
                    noteId: noteCubit.newNoteList.elementAt(index)['id']);
              },
              itemCount: noteCubit.newNoteList.length,
            );
          } else {
            return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No new notes found, click the add button to add more',
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
                ));
          }
        })());
      },
    );
  }
}
