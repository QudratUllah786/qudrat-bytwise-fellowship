import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view-model/auth/login_view_model.dart';
class ConfirmPasswordTextField extends StatefulWidget {
  ConfirmPasswordTextField({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordTextField> createState() => _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  late LoginController loginController;

  @override
  void initState(){
    loginController =  Get.find<LoginController>(tag: 'login');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (v){
        if(v!.isEmpty){
          return 'Please Enter Password';
        } else if(v.length<6){
          return 'Please Enter more than 6 digits Password ';
        }
        else if(loginController.confirmPasswordController.value.text != loginController.passwordController.value.text)
        {
          return 'Password is not same';
        }
        return null;
      },
      controller: loginController.confirmPasswordController,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        hintText:'Enter Confirm Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}
