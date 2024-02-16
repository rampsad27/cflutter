import 'package:instagram_app/models/user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsAuthRepository {
  DetailsAuthRepository() {
    _getSharedPreferenceInstance();
  }

  SharedPreferences? prefs;

  Future<void> _getSharedPreferenceInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  final String _name = "name";
  final String _username = "username";
  final String _bio = "bio";

  Future<String> saveDetailsInfo(
      String name, String username, String bio) async {
    await prefs?.setString(_name, name);
    await prefs?.setString(_username, username);
    await prefs?.setString(_bio, bio);
    return 'success';
  }

  DetailModel getDetailsInfo() {
    var name = prefs?.getString(_name);
    var username = prefs?.getString(_username);
    var bio = prefs?.getString(_bio);

    return DetailModel(
        name: name ?? "", username: username ?? "", bio: bio ?? "");
  }
}
