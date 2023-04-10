import 'package:firebase/resources/color/color.dart';
import 'package:firebase/resources/components/round_button.dart';
import 'package:firebase/utils/routes/routes_name.dart';
import 'package:firebase/views/auth/widgets/PasswordTextField.dart';
import 'package:firebase/views/auth/widgets/email_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view-model/auth/login_view_model.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late LoginController loginController;
  @override
  void initState(){
    loginController = Get.find<LoginController>(tag: 'login');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              EmailTextField(),
              const SizedBox(height: 20,),
              PasswordTextField(),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text:  TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Don\'t Have an Account ',
                      style: TextStyle(
                        color:AppColors.purple,
                      )
                    ),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Get.toNamed(RoutesName.signUpView);
                          },
                      text: 'Sign Up',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color:AppColors.purple,
                        )
                    )
                  ]
                ),),
              ),
              const SizedBox(height: 20,),
              Obx(
                ()=> RoundButton(
                  loading: loginController.loading.value,
                  onTap: (){
                    loginController.loading.value = true;
                    if(_formKey.currentState!.validate()){
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: loginController.emailController.text.trim(),
                          password: loginController.passwordController.text.trim()
                      ).then((value) {
                        loginController.loading.value = false;
                        Get.toNamed(RoutesName.postView);
                      }).onError((error, stackTrace){
                        loginController.loading.value = false;
                        Utils.snackBar(
                            'Error',
                            error.toString(),
                            SnackPosition.BOTTOM,
                            AppColors.redColor,
                            AppColors.whiteColor
                        );
                      });
                       const Center(child: CircularProgressIndicator());
                    }
                  },
                  txt: 'lo_btn',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
