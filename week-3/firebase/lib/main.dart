
import 'package:firebase/resources/Binding/binding.dart';
import 'package:firebase/resources/getxlocalization/languages.dart';
import 'package:firebase/utils/routes/routes.dart';
import 'package:firebase/utils/routes/routes_name.dart';
import 'package:firebase/views/slpash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: StoreBinding(),
      translations: Languages(),
      locale: Locale(
        'en','US',
      ),
      fallbackLocale: const Locale('ur','PK'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
