import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/veiws/widgets/Add_notes_button_sheet.dart';
import 'package:untitled/veiws/widgets/notes_veiw_body.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class NotesVeiw extends StatelessWidget {
  const NotesVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context, builder: (BuildContext context) {
            return const AddNoteButtonSheet();
          });
        },
          child: Icon(Icons.add),),
        body: const SafeArea(
            child: NotesVeiwBody()
        ));
  }
}

