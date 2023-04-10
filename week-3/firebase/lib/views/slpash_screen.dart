import 'package:firebase/resources/color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view-model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState(){
    splashServices.login();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.purple,
      body: Container(
        alignment: Alignment.center,
          child: Text('splash'.tr,style: TextStyle(
            color: AppColors.whiteColor
          ),)),
    );
  }
}
