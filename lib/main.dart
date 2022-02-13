import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';
import 'package:todo_flutter/screens_carrier/bottom_nav_carrier.dart';

void main() {
  runApp(const MyApp());
  //initialize intl package to use it later for formatting time
  initializeDateFormatting();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NoteCubit(),
        child: BottomNavCarrier(),
      ),
    );
  }
}
