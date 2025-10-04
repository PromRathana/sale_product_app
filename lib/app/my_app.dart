import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/authentication/view/login_view.dart';
import 'package:sale_product_app/features/authentication/view/register_view.dart';
import 'package:sale_product_app/features/home/view/home_view.dart';
import 'package:sale_product_app/features/splash/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: ()=>SplashView(),transition: Transition.fadeIn),
        GetPage(name: "/home", page: ()=>HomeView()),
        GetPage(name: "/login", page: ()=>LoginView()),
        GetPage(name: "/register", page: ()=>RegisterView()),
      ],
    );
  }
}
