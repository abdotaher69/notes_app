import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class ColorListVeiw extends StatefulWidget {
  const ColorListVeiw({super.key});

  @override
  State<ColorListVeiw> createState() => _ColorListVeiwState();
}

class _ColorListVeiwState extends State<ColorListVeiw> {
  int currentIndex = 0;

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
                setState(() {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
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
