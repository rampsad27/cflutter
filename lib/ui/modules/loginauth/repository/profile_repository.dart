import 'package:ig/ui/modules/components/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  ProfileRepository() {
    _getSharedInstance();
  }

  Future<void> _getSharedInstance() async {
    preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? preferences;
  final String _name = 'name';
  final String _username = 'username';

  Future<bool> saveUserProfileInfo(String name, String username) async {
    await preferences?.setString(_name, name);
    await preferences?.setString(_username, username);
    return true;
  }

  UserProfileNameModel getUserProfileInfo() {
    var name = preferences?.getString(_name);
    var username = preferences?.getString(_username);
    return UserProfileNameModel(
        name: name ?? "Add Name", username: username ?? "add");
  }
}
