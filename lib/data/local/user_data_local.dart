import 'package:get_storage/get_storage.dart';
import 'package:sale_product_app/constants/constant_key.dart';
import 'package:sale_product_app/models/response/User.dart';

class UserDataLocal {
  // static String username = "USERNAME";
  // static String email = "EMAIL";
  // static String phone = "PHONE";
  // static String refreshToken = "REFRESH_TOKEN";
  // static String accessToken = "ACCESS_TOKEN";

  //Save UserData (Write)
  static saveUserData(User user) {
    var storage = GetStorage();
    storage.write(ConstantKey.username, user.username);
    storage.write(ConstantKey.phone, user.phoneNumber);
    storage.write(ConstantKey.email, user.email);
  }

  //Get UserData (Read)
  static User getUserData() {
    var storage = GetStorage();
    return User(
      username: storage.read(ConstantKey.username),
      email: storage.read(ConstantKey.email),
      phoneNumber: storage.read(ConstantKey.phone),
    );
  }

  //Save Access Token
  static saveAccessToken(String token) {
    var storage = GetStorage();
    storage.write(ConstantKey.accessToken, token);
  }

  //Remove UserData (Logout)
  static removeUserData() {
    var storage = GetStorage();
    storage.remove(ConstantKey.username);
    storage.remove(ConstantKey.phone);
    storage.remove(ConstantKey.email);
    storage.remove(ConstantKey.accessToken);
    storage.remove(ConstantKey.refreshToken);
  }

  //Save Refresh Token
  static saveRefreshToken(String refresh) {
    var storage = GetStorage();
    storage.write(ConstantKey.refreshToken, refresh);
  }

  //Get Access Token
  static getAccessToken() {
    var storage = GetStorage();
    return storage.read(ConstantKey.accessToken);
  }

  //Get Refresh Token
  static getRefreshToken() {
    var storage = GetStorage();
    return storage.read(ConstantKey.refreshToken);
  }
}
