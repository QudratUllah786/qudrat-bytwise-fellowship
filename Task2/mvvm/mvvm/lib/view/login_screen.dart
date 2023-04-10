import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view-model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final authViewModel = Get.put(AuthViewModel());

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            focusNode: emailFocus,
            onFieldSubmitted: (v) {
              Utils.fieldFocusChange(context, emailFocus, passwordFocus);
            },
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: hieght * 0.01,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _passwordController,
            focusNode: passwordFocus,
            obscuringCharacter: '*',
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: hieght * 0.1,
          ),
          RoundButton(

              txt: 'Login',
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.errorMessageFlush('Please Enter Email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.errorMessageFlush('Please Enter Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.errorMessageFlush(
                      'Please Enter more than 6 digit Password', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                  // Utils.errorMessageFlush('Succes', context);
                }
              }),
        ],
      ),
    );
  }
}
