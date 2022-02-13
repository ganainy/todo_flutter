import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/note_bloc/note_cubit.dart';
import 'package:todo_flutter/screens/archived_notes.dart';
import 'package:todo_flutter/screens/done_notes.dart';
import 'package:todo_flutter/screens/new_notes.dart';
import 'package:todo_flutter/shared/reusable_components.dart';

class BottomNavCarrier extends StatelessWidget {
  var _selectedIndex = 0;
  late Function(int) _onItemTapped;

  var currentDate = DateTime.now();

  var lastDate;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> bottomNavScreens = [NewNotes(), DoneNotes(), ArchivedNotes()];

  //todo validate

  /*currentTime = DateFormat("HH:mm").format(DateTime.now());
  currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());*/

  @override
  Widget build(BuildContext context) {
    //get max allowed date in datepicker
    lastDate = currentDate.add(Duration(days: 365 * 3));
    var noteCubit = NoteCubit.get(context);
    NoteCubit.get(context).openDb();

//forkey for validation
    final _formKey = GlobalKey<FormState>();

    //on click of bottomsheet items
    _onItemTapped = (index) {
      _selectedIndex = index;
    };

    return BlocConsumer<NoteCubit, NoteStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: BlocBuilder<NoteCubit, NoteStates>(
            builder: (context, state) {
              return FloatingActionButton(
                  child: noteCubit.fabIcon,
                  onPressed: () {
                    onFabClick(context, noteCubit, _formKey);
                  });
            },
          ),
          body: bottomNavScreens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined),
                label: "Tasks",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: "Done",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: "Archived",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }

  void onFabClick(
      BuildContext context, NoteCubit noteCubit, GlobalKey<FormState> formKey) {
    if (noteCubit.isBottomSheetShown) {
      //user clicked to save the note
      noteCubit.setNote(noteCubit.noteController.value.text);

//only add note to db if the validation was successful
      if (formKey.currentState!.validate()) {
        print('validated success');
        noteCubit.addNote(noteCubit);
        Navigator.pop(context);
        noteCubit.isBottomSheetShown = false;
      }
    } else {
      scaffoldKey.currentState!
          .showBottomSheet((context) {
            return AddNoteSheet(context, noteCubit, formKey);
          })
          .closed
          .then((value) {
            //this code will be activated if bottomsheet is closed
            //so that we change icon back to + incase user closes bottomsheet manually

            noteCubit.isBottomSheetShown = false;
          });
    }

    noteCubit.isBottomSheetShown = true;
  }

  Widget AddNoteSheet(
      BuildContext context, NoteCubit noteCubit, GlobalKey<FormState> formKey) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(8),
      color: Colors.grey[400],
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultFormField('Enter your note', noteCubit.noteController,
                validator: (value) {
              if (value.isNotEmpty) {
                //success
                return null;
              } else {
                return 'Note can\'t be empty';
              }
            }, prefixIcon: const Icon(Icons.event_note)),
            Container(
              // margin: EdgeInsets.all(12),
              child:
                  DefaultFormField('Select note time', noteCubit.timeController,
                      prefixIcon: Icon(Icons.access_time_outlined),
                      validator: (value) {
                        if (value.isNotEmpty) {
                          //success
                          return null;
                        } else {
                          return 'Note time can\'t be empty';
                        }
                      },
                      isReadOnly: true,
                      onFieldTap: () async {
                        //on tap on the field should show time picker
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((selectedTime) {
                          BlocProvider.of<NoteCubit>(context)
                              .setTime(selectedTime?.format(context));
                        });
                      }),
            ),
            Container(
              //margin: EdgeInsets.all(12),
              child:
                  DefaultFormField('Select note date', noteCubit.dateController,
                      validator: (value) {
                        if (value.isNotEmpty) {
                          //success
                          return null;
                        } else {
                          return 'Note date can\'t be empty';
                        }
                      },
                      prefixIcon: const Icon(Icons.calendar_today),
                      isReadOnly: true,
                      onFieldTap: () async {
                        //on tap on the field should show time picker
                        await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: currentDate,
                          lastDate: lastDate,
                        ).then((selectedDate) {
                          BlocProvider.of<NoteCubit>(context)
                              .setDate(selectedDate.toString());
                        });
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
