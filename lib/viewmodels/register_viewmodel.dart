import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
class RegisterViewModel with ChangeNotifier {
    final ApiService _apiService = ApiService();
    List<User> _usuarios = [];
    bool _isLoading = false;
    String email = '';
    String password = '';
    bool get isLoading => _isLoading;

    Future<void> fetchUsers() async {
    _usuarios = await _apiService.fetchUsers();
    }
    Future<bool> validateLogin() async {
      _isLoading = true;
      notifyListeners();
      await fetchUsers();
      final user = _usuarios.firstWhere(
        (u) => u.email == email && u.password == password,
        orElse: () => User(usersid: 0, email: '', password: ''),
      );
      _isLoading = false;
      notifyListeners();
      if (user.email.isNotEmpty) {
        debugPrint("Login correcto");
        return true;
      } else {
        debugPrint("Credenciales incorrectas");
        return false;
      }
    }
}