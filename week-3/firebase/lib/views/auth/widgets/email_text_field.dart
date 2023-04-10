import 'package:firebase/view-model/auth/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
class EmailTextField extends StatefulWidget {
 EmailTextField({Key? key}) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late LoginController loginController;
  @override
  void initState(){
    loginController =  Get.find<LoginController>(tag: 'login');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      focusNode: loginController.emailFocus,
      onFieldSubmitted: (v){
        Utils.fieldFocusChange(
            context,
            loginController.emailFocus,
            loginController.passwordFocus
        );
      },
      validator: (v){
        if(v!.isEmpty){
          return 'Please Enter Email';
        } else if(!v.isEmail){
          return 'Please Enter in @ Format';
        }
        return null;
      },
      controller: loginController.emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}
