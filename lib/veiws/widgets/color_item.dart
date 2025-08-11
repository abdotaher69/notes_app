import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key,required this.isSelected,required this.color});
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected? CircleAvatar(
      radius: 34,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 30,
      ),
    ): CircleAvatar(
      backgroundColor: color,
      radius: 30,
    );
  }
}
