import 'package:flutter/material.dart';
import 'package:mvvm/res/components/color.dart';
class RoundButton extends StatelessWidget {
  final String txt;
  final bool loading;
  final VoidCallback onPress;


  RoundButton({Key? key,
    required this.txt,
     this.loading = false,
    required this.onPress

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: loading?CircularProgressIndicator(color: Colors.white,): Text(txt,style: TextStyle(color: AppColors.whiteColor),),
      ),
    );
  }
}
