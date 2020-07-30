import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo {
  final SharedPreferences sharedPreferences;

  LocalRepo({@required this.sharedPreferences});

//  static const String USER = 'user';

//  Future<void> setUser(User user) async {
//    String userJson = jsonEncode(user);
//    return await sharedPreferences.setString(USER, userJson);
//  }
//
//  User getUser() {
//    String user = sharedPreferences.getString(USER);
//    if (user != null) {
//      var map = jsonDecode(sharedPreferences.getString(USER));
//      return User.fromJson(map);
//    }
//    return null;
//  }
//
//  void removeUser() {
//    sharedPreferences.remove(USER);
//  }
}
