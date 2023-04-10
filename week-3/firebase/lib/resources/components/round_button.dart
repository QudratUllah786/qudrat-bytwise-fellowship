import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/color.dart';
class RoundButton extends StatefulWidget {
  RoundButton({Key? key, required this.onTap,required this.txt,required this.loading}) : super(key: key);
   VoidCallback onTap;
   String txt;
   bool loading = true;
  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.height*0.07,
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(30),
        ),
        child: widget.loading?const Center(
          child: CircularProgressIndicator(
            color: AppColors.whiteColor,
          ),
        ) :Text(widget.txt.tr,style: TextStyle(color: AppColors.whiteColor),),
      ),
    );
  }
}
