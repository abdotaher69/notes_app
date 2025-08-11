import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import 'noteItem.dart';
import 'notes_listveiw.dart';

class NotesVeiwBody extends StatefulWidget {
  const NotesVeiwBody({super.key, });

  @override
  State<NotesVeiwBody> createState() => _NotesVeiwBodyState();
}

class _NotesVeiwBodyState extends State<NotesVeiwBody> {

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        CustomAppbar(title: "Notes",icon: Icons.search,),
        NotesListView(),


      ],),
    );
  }
}







