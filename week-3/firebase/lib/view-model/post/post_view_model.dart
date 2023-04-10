import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostViewModel extends GetxController{
  TextEditingController addPostController  = TextEditingController();
  RxBool loading = false.obs;
}