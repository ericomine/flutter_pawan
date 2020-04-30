class User {
  String _username;
  String get username => _username;
  
  String _password;
  String get password => _password;

  User(this._username, this._password);

  User.fromMap(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }
}