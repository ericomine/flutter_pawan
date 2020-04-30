class NetworkUtil {
  // This is a singleton in Dart:
  // Single _instance built from 
  static NetworkUtil _instance = NetworkUtil.internal();
  // this named constructor:
  NetworkUtil.internal();
  // factory keyword makes this a singleton.
  factory NetworkUtil() => _instance;

  Future<dynamic> get() {
    // Placeholder for HTTP requests.
    return null;
  }


}