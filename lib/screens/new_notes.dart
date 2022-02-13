import 'package:flutter/material.dart';

class NewNotes extends StatefulWidget {
  const NewNotes({Key? key}) : super(key: key);

  @override
  _NewNotesState createState() => _NewNotesState();
}

class _NewNotesState extends State<NewNotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'New Notes',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
