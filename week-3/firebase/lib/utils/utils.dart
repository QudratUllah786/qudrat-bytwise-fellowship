import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Utils{
  static void fieldFocusChange(BuildContext context, FocusNode current,FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static snackBar(
      String title,
      String message,
      SnackPosition position,
      Color color,
      Color txtColor,){
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      colorText: txtColor,
      backgroundColor: color,
    );
  }


}