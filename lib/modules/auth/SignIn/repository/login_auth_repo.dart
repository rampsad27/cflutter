import 'package:instagram_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuthenticationRepository {
  LoginAuthenticationRepository() {
    _getSharedPreferenceInstance();
  }
  SharedPreferences? pref;

  Future<void> _getSharedPreferenceInstance() async {
    pref = await SharedPreferences.getInstance();
  }

  final String _username = "username";
  final String _password = "password";

  Future<String> saveLoginInfo(String username, String password) async {
    await pref?.setString(_username, username);
    await pref?.setString(_password, password);
    return "Login Success";
  }

  UserModel getLoginInfo() {
    var username = pref?.getString(_username);
    var password = pref?.getString(_password);

    return UserModel(username: username ?? "", password: password ?? "");
  }

  Future<bool?> logout() async {
    return await pref?.clear();
  }
}
