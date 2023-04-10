import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view-model/auth/login_view_model.dart';
class PasswordTextField extends StatefulWidget {
 PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
 late LoginController loginController;

 @override
 void initState(){
   loginController =  Get.find<LoginController>(tag: 'login');
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      focusNode: loginController.passwordFocus,
      validator: (v){
        if(v!.isEmpty){
          return 'Please Enter Password';
        } else if(v.length<6){
          return 'Please Enter more than 6 digits Password ';
        }

         return null;
      },
      controller: loginController.passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText:'Enter Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}
