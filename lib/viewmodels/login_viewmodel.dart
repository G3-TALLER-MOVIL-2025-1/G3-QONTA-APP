import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../utils/user_preferences.dart';
import '../main.dart';


class LoginViewModel with ChangeNotifier {
    final ApiService _apiService = ApiService();
    List<User> _usuarios = [];
    bool _isLoading = false;
    String email = '';
    String password = '';
    bool get isLoading => _isLoading;

    // Future<void> fetchUsers() async {
    // _usuarios = await _apiService.fetchUsers();
    // }
    Future<void> fetchUsers() async {
    _usuarios = await _apiService.fetchUsers();
    }
    Future<int> fetchUsersLogin(String email, String password) async {
    return await _apiService.fetchUsersLogin(email, password);
    }
    Future<bool> validateLogin() async {
      _isLoading = true;
      notifyListeners();
      int usersid = await fetchUsersLogin(email, password);
      // final user = _usuarios.firstWhere(
      //   (u) => u.email == email && u.password == password,
      //   orElse: () => User(usersid: 0, email: '', password: '',name: '', lastname: ''),
      // );
      _isLoading = false;
      notifyListeners();
      // if (user.email.isNotEmpty) {
      //   UserPreferences.instance.preferences!.setInt('usersid', user.usersid);
      //   debugPrint("Login correcto");
      //   // debugPrint("Login correcto");
        
      //   return true;
      // } else {
      //   debugPrint("Credenciales incorrectas");
      //   return false;
      // }
      if (usersid != 0) {
        UserPreferences.instance.preferences!.setInt('usersid', usersid);
        debugPrint("Login correcto");
        // debugPrint("Login correcto");
        
        return true;
      } else {
        debugPrint("Credenciales incorrectas");
        return false;
      }
    }
}