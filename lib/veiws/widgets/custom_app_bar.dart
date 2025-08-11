import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key,required this.title,required this.icon,this.onpressed});
  final String title;
  final IconData icon;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      Spacer(),
      CustomSearchIcon(icon: icon,onpressed: onpressed,),

    ],);
  }
}

