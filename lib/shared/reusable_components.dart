import 'package:flutter/material.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';

DefaultFormField(
  String labelText,
  TextEditingController controller, {
  bool obscureText = false,
  Icon? prefixIcon,
  Icon? suffixIcon,
  TextInputType? keyboardType,
  GestureTapCallback? onFieldTap,
  bool? isReadOnly,
  FormFieldValidator? validator,
}) {
  return TextFormField(
    onTap: onFieldTap,
    keyboardType: keyboardType,
    controller: controller,
    obscureText: obscureText,
    readOnly: isReadOnly ?? false,
    validator: validator,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
    ),
  );
}

PickerRow(
    {required Icon icon,
    required BuildContext context,
    required bool isTimePicker}) {
  return;
}

NoteItem(
    {@required int? noteId,
    @required String? note,
    @required String? time,
    @required String? date,
    @required BuildContext? context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25,
          child: Text(
            '$time',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          '$note',
          style: TextStyle(fontSize: 20),
        )),
        Column(
          children: [
            Text(
              '$date',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    NoteCubit.get(context).updateNote('done', noteId!);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.archive,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    NoteCubit.get(context).updateNote('archived', noteId!);
                  },
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

_showTimePicker(var context) async {}

_showDatePicker(var context) async {}
