import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/note_model.dart';
import 'color_list_veiw.dart';
import 'custom_button.dart';
import 'custom_textfeild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(children: [
        SizedBox(height: 32,),
        CustomTextfeild(hintText: "Title", onSaved: (value) {
          title = value;
        }),
        SizedBox(height: 16,),
        CustomTextfeild(hintText: "Content", maxLines: 5, onSaved: (value) {
          subTitle = value;
        }),

        
        
        SizedBox(height: 20,),
        ColorListVeiw(),
        SizedBox(height: 20,),


        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var date = DateTime.now();
                var formatedDate= DateFormat.yMMMMd().format(date);

                BlocProvider.of<AddNoteCubit>(context).addNote(
                    NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedDate,
                        color: Colors.blue.value
                    ));
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            }
            );

          },
        ),
        SizedBox(height: 60,),
      ],),
    );
  }
}



