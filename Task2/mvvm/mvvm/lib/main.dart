import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mvvm/res/components/GetxLocalization/languages.dart';
import 'package:mvvm/utils/routes/name_routes.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('ur','PK'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.appRoutes(),
      // onGenerateRoute: AppRoutes.generateRoute, // this will use when i'm not using Getx
    );

  }
}


