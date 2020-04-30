import 'package:fluttersqflite/utils/network_util.dart';

class RestData {
  NetworkUtil _networkUtil = NetworkUtil();
  
  static const BASE_URL = "";
  static const LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return null
  }
}