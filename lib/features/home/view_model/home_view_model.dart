import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sale_product_app/utils/message_utils.dart';
import '../../../constants/app_routes.dart';
import '../../../data/local/user_data_local.dart';
import '../../../models/response/User.dart';

class HomeViewModel extends GetxController {
  var user = User().obs;
  // var storage = GetStorage().obs;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
    // final box = GetStorage();
    // print("--- STORAGE CONTENTS ---");
    // box.getKeys().forEach((key) {
    //   print("Key: $key, Value: ${box.read(key)}");
    // });
    // print("------------------------");
  }

  getUserProfile() {
    var userStorage = UserDataLocal.getUserData();
    user.value.username = userStorage.username ?? "";
    user.value.phoneNumber = userStorage.phoneNumber ?? "";
    user.value.email = userStorage.email ?? "";
    user.refresh();
  }

  void logoutAndLogin()
  {
    if (user.value.username != "")
      {
        confirmLogout();
      }
    else
      {
        Get.toNamed(AppRoutes.login);
      }
  }

  confirmLogout() {
    MessageUtil.confirmMessageDialog(
      title: 'Sign Out',
      middleText: 'Do you want to sign out?',
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      onConfirm: () {
        Get.offAllNamed(AppRoutes.splash);
        UserDataLocal.removeUserData();
      },
      onCancel: () => print('Canceled'),
    );
  }
}
