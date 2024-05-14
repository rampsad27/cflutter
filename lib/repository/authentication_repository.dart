import 'package:ig/ui/modules/components/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  AuthenticationRepository() {
    _getSharedPrefInstance();
  }

  Future<void> _getSharedPrefInstance() async {
    preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? preferences;
  final String _email = 'email';
  final String _password = 'password';

  Future<bool> saveUserInfo(String email, String password) async {
    await preferences?.setString(_email, email);
    await preferences?.setString(_password, password);
    return true;
  }

  UserNameModel getUserInfo() {
    var email = preferences?.getString(_email);
    return UserNameModel(email: email ?? "");
  }

  Future<bool> isUserLoggedIn() async {
    var email = preferences?.getString(_email);
    var password = preferences?.getString(_password);

    return email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  Future<bool?> logout() async {
    return await preferences?.clear();
  }
}
