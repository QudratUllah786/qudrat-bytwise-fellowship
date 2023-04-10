import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mvvm/res/components/color.dart';

class Utils{

 static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode next){
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
 }

 static  toastMessage(String message){
  Fluttertoast.showToast(msg: message,
   backgroundColor: Colors.deepPurple,
   textColor: AppColors.whiteColor,
   toastLength: Toast.LENGTH_LONG,
   gravity: ToastGravity.BOTTOM,
   );
  }

  static snackBar(String title, String message){
  Get.snackbar(title, message);
  }

  static void errorMessageFlush(String message,BuildContext context){
   showFlushbar(context: context,
       flushbar: Flushbar(
         borderRadius: BorderRadius.circular(10),
        message: message,
       // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        backgroundColor: Colors.red,
        messageColor: Colors.white,
        forwardAnimationCurve: Curves.easeIn,
        reverseAnimationCurve: Curves.easeInOut,
         padding: EdgeInsets.all(10),
         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         duration:const Duration(seconds: 5),
       )..show(context),
   );
  }

}