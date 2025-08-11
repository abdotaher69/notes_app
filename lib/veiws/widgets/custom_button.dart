import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onTap,this.isLoading=false});
 final void Function()? onTap;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kprimaryColor,

        ),
        child:isLoading?Center(child: CircularProgressIndicator(color: Colors.white,),)
            : Center(
            child:
            Text("Add Note",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}