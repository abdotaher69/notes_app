import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';
import 'custom_button.dart';
import 'custom_textfeild.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.white,
                    content: Text("Note Added Successfully")));
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return  AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding:  EdgeInsets.only(left: 16, right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                  child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}