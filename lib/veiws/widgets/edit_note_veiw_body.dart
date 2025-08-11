import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/veiws/widgets/custom_textfeild.dart';

import '../../constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'color_item.dart';
import 'custom_app_bar.dart';

class EditNoteVeiwBody extends StatefulWidget {
  const EditNoteVeiwBody({super.key,required this.note });
  final NoteModel note;

  @override
  State<EditNoteVeiwBody> createState() => _EditNoteVeiwBodyState();
}

class _EditNoteVeiwBodyState extends State<EditNoteVeiwBody> {
   String? title;
   String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
               CustomAppbar(icon: Icons.check,title: "Edit Note",onpressed: () {
                  widget.note.title=title?? widget.note.title;
                  widget.note.subTitle=subTitle?? widget.note.subTitle;
                 widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                 Navigator.pop(context);

               }),
        SizedBox(height: 30,),
        CustomTextfeild(hintText:widget.note.title ,onChanged: (value) {
          title=value;
        }),
        SizedBox(height: 16,),
        CustomTextfeild(hintText: widget.note.subTitle,maxLines: 5,onChanged: (value) {
          subTitle=value;
        }),
        SizedBox(height: 20,),
        EditNoteColorListVeiw(note: widget.note,),


      ],),
    );
  }
}
class EditNoteColorListVeiw extends StatefulWidget {
  const EditNoteColorListVeiw({super.key,required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorListVeiw> createState() => _EditNoteColorListVeiwState();
}

class _EditNoteColorListVeiwState extends State<EditNoteColorListVeiw> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex=colors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () {
                widget.note.color=colors[index].value;
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                color: colors[index],
                isSelected: index==currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}