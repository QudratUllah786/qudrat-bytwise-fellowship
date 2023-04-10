import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends GetxController {
  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      Utils.errorMessageFlush('Login Successfully', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.errorMessageFlush(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
