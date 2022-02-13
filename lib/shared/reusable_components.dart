import 'package:flutter/material.dart';

DefaultFormField(
  String labelText,
  TextEditingController controller, {
  bool obscureText = false,
  Icon? prefixIcon,
  Icon? suffixIcon,
  TextInputType? keyboardType,
  GestureTapCallback? onFieldTap,
  bool? isReadOnly,
}) {
  return TextFormField(
    onTap: onFieldTap,
    keyboardType: keyboardType,
    controller: controller,
    obscureText: obscureText,
    readOnly: isReadOnly ?? false,
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

_showTimePicker(var context) async {}

_showDatePicker(var context) async {}
