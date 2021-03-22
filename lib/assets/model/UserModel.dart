class UserModel {
  String _email;
  String _password;

  String get email => _email != null ? _email : '';
  String get password => _password != null ? _password : '';

  set email(String email) => _email = email;
  set password(String password) => _password = password;
}
