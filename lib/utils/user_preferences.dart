import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  late SharedPreferences? preferences;
   UserPreferences._();

  Future init() async =>
    preferences = await SharedPreferences.getInstance();

  Future<void> setUsersId(int idUser) async {
    await preferences!.setInt('usersid', idUser);
  }

  Future<int?> getUsersId() async {
    return await preferences!.getInt('usersid');
  }
  static final UserPreferences instance = UserPreferences._();

}