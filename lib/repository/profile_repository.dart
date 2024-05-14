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
  final String _bio = 'bio';

  Future<bool> saveUserProfileInfo(
      String name, String username, String bio) async {
    await preferences?.setString(_name, name);
    await preferences?.setString(_username, username);
    await preferences?.setString(_bio, bio);
    return true;
  }

  UserProfileNameModel getUserProfileInfo() {
    var name = preferences?.getString(_name);
    var username = preferences?.getString(_username);
    var bio = preferences?.getString(_bio);
    return UserProfileNameModel(
        name: name ?? " ", username: username ?? " ", bio: bio ?? " ");
  }
}
