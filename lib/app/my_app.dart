import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/constants/app_routes.dart';
import 'package:sale_product_app/features/admin/manage/category/view/category_form_view.dart';
import 'package:sale_product_app/features/admin/manage/category/view/category_view.dart';
import 'package:sale_product_app/features/admin/manage/product/view/product_view.dart';
import 'package:sale_product_app/features/authentication/view/login_view.dart';
import 'package:sale_product_app/features/authentication/view/register_view.dart';
import 'package:sale_product_app/features/home/view/home_view.dart';
import 'package:sale_product_app/features/splash/view/splash_view.dart';
import 'package:sale_product_app/utils/message.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splash,
      translations: Messages(),
      locale: Locale("km", "KH"),
      fallbackLocale: Locale("km", "KH"),
      getPages: [
        GetPage(
          name: AppRoutes.home,
          page: () => SplashView(),
          transition: Transition.fadeIn,
        ),
        GetPage(name: AppRoutes.splash, page: () => HomeView()),
        GetPage(name: AppRoutes.login, page: () => LoginView()),
        GetPage(name: AppRoutes.register, page: () => RegisterView()),
        GetPage(
          name: AppRoutes.adminManageCategory,
          page: () => CategoryView(),
        ),
        GetPage(
          name: AppRoutes.adminManageCategoryForm,
          page: () => CategoryFormView(),
        ),
        GetPage(name: AppRoutes.adminManageProduct, page: () => ProductView()),
      ],
    );
  }
}
