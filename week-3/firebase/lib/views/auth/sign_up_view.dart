import 'package:firebase/view-model/auth/login_view_model.dart';
import 'package:firebase/views/auth/widgets/PasswordTextField.dart';
import 'package:firebase/views/auth/widgets/confirmPasswordField.dart';
import 'package:firebase/views/auth/widgets/email_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/color/color.dart';
import '../../resources/components/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late LoginController loginController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState(){
    loginController = Get.find<LoginController>(tag: 'login');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign-up'.tr),
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
              const SizedBox(height: 20,),
              ConfirmPasswordTextField(),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text:  TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Already Have an Account ',
                            style: TextStyle(
                              color:AppColors.purple,
                            )
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              Get.toNamed(RoutesName.loginView);
                            },
                            text: 'Login',
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
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email:loginController.emailController.text.trim() ,
                          password: loginController.passwordController.text.trim()).
                      then((value) {
                        loginController.loading.value = false;
                        Get.toNamed(RoutesName.loginView);
                      }).onError((error, stackTrace){
                        loginController.loading.value = false;
                        Utils.snackBar('Error', error.toString(), SnackPosition.BOTTOM, AppColors.redColor, AppColors.whiteColor);
                      });
                    }
                  },
                  txt: 'sign_btn',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
