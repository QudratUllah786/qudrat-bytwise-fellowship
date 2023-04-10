import 'package:firebase/utils/routes/routes_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../views/auth/login_view.dart';
import '../../views/auth/sign_up_view.dart';
import '../../views/post/add-post/add_post_screen.dart';
import '../../views/post/post_view.dart';
import '../../views/slpash_screen.dart';

class AppRoutes{
  static appRoutes()=>[
    GetPage(
      name: RoutesName.splashView,
      page:()=>const SplashView(),
      transition:Transition.leftToRight,
    ),
    GetPage(
      name: RoutesName.loginView,
      page:()=>const LoginView(),
      transition:Transition.leftToRight,
    ),
    GetPage(
      name: RoutesName.signUpView,
      page:()=>const SignUpView(),
      transition:Transition.leftToRight,
    ),
    GetPage(
      name: RoutesName.postView,
      page:()=>const PostView(),
      transition:Transition.leftToRight,
    ),
    GetPage(
      name: RoutesName.addPostView,
      page:()=>const AddPostView(),
      transition:Transition.leftToRight,
    ),
  ];
}