import 'package:get/get.dart';

import '../../view-model/auth/login_view_model.dart';
import '../../view-model/post/post_view_model.dart';

class  StoreBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(),tag: 'login');
    Get.lazyPut(() => PostViewModel(),tag: 'post');
  }

}