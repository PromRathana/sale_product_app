import 'package:get/get.dart';
import 'package:sale_product_app/constants/app_routes.dart';
import 'package:sale_product_app/features/splash/model/splash_model.dart';

class SplashViewModel extends GetxController {
  var splashModel = SplashModel().obs;
  @override
  void onInit() {
    setTimeSplash();
    setTitleValue();
    super.onInit();
  }

  setTitleValue() {
    splashModel.value.title = "Welcome to";
    splashModel.value.subTitle = "Sale Product App";
  }

  setTimeSplash() async {
    await Future.delayed(Duration(seconds: 1));
    Get.offNamed(AppRoutes.home);
  }
}