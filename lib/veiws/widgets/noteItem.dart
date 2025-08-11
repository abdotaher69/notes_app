import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import '../edit_note_veiw.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditNoteVeiw(note: note)));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: TextStyle(fontSize: 30,color: Colors.black),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(note.subTitle,style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.7),)),
              ),
              trailing: IconButton(
                icon:Icon(Icons.delete,color: Colors.black,size: 30,),
                onPressed: () {
                 note.delete();
                 BlocProvider.of<NotesCubit>(context).fetchNotes();
                },),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(note.date,style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.7)),),
            )
          ],
        ),
      ),
    );
  }
}