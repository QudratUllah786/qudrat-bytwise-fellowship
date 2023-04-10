import 'dart:async';

import 'package:firebase/utils/routes/routes.dart';
import 'package:firebase/utils/routes/routes_name.dart';
import 'package:firebase/views/auth/login_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashServices{
  void login(){
    Timer(const Duration(milliseconds: 200), () {
       Get.toNamed(RoutesName.loginView);
    });
  }
}