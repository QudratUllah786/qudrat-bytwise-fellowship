import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/utils/routes/name_routes.dart';
import 'package:mvvm/view/home_screen.dart';

import '../../view/login_screen.dart';

/// <---------------- When I'm using Getx then i will write Routes class like following ---------------->

class AppRoutes{
 static appRoutes ()=>[
   GetPage(name: RoutesName.loginScreen, page: ()=> const LoginScreen(),transition: Transition.leftToRight),
   GetPage(name: RoutesName.homeScreen, page: ()=> const HomeScreen(),transition: Transition.leftToRight),
 ];
}









/// <---------------- When I am not using Getx then i will write Routes class like following ---------------->
/*
class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Column(
              children: const [
                Text('No route found'),
              ],
            ),
          );
        }
        );
    }
  }
}*/
