import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/veiws/widgets/edit_note_veiw_body.dart';

import '../models/note_model.dart';

class EditNoteVeiw extends StatelessWidget {
  const EditNoteVeiw({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child:EditNoteVeiwBody(note: note,)
        )
    );
  }
}
