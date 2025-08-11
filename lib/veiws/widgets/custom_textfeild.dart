import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({super.key,required this.hintText,this.maxLines=2,this.onSaved, this.onChanged});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
        },
      maxLines: maxLines,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color: kprimaryColor),
        border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(

            ),
        focusedBorder: buildOutlineInputBorder(color: kprimaryColor)
      )

    );
  }

  OutlineInputBorder buildOutlineInputBorder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color:color ?? Colors.white,
          width: 1,
        )

      );
  }
}
