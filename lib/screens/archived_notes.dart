import 'package:flutter/material.dart';

class ArchivedNotes extends StatefulWidget {
  const ArchivedNotes({Key? key}) : super(key: key);

  @override
  _ArchivedNotesState createState() => _ArchivedNotesState();
}

class _ArchivedNotesState extends State<ArchivedNotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Archived Notes',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
