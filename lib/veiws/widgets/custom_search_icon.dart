import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon,this.onpressed});
final IconData icon;
final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      )
      ,child: IconButton(onPressed:onpressed, icon: Icon(icon,color: Colors.white,size: 30,),)

    );
  }
}