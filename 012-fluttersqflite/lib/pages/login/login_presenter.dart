import 'package:fluttersqflite/data/rest_data.dart';
import 'package:fluttersqflite/models/user.dart';

// VIEW
abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

// PRESENTER
class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = RestData();
  LoginPagePresenter(this._view);

  void doLogin(String username, String password) {
    api
      .login(username, password)
      .then((user) => _view.onLoginSuccess(user))
      .catchError((onError) => _view.onLoginError(onError));
  }
}
