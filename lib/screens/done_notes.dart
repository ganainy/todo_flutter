import 'package:flutter/material.dart';

class DoneNotes extends StatefulWidget {
  const DoneNotes({Key? key}) : super(key: key);

  @override
  _DoneNotesState createState() => _DoneNotesState();
}

class _DoneNotesState extends State<DoneNotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Done Notes',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
