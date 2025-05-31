import 'package:flutter/material.dart';
import 'package:qonta_app/models/transaction.dart';
import '../models/user.dart';
import '../services/api_service.dart';
class RegisterViewModel with ChangeNotifier {
    final ApiService _apiService = ApiService();
    List<User> _usuarios = [];
    List<User> usuarios = [];
    bool _isLoading = false;
    String email = '';
    String password = '';
    String em = '';
    String pass = '';
    String name = '';
    String lastname = '';
    // ==========================
    String categoryname = '';
    String amount = '';
    String description = '';

    bool get isLoading => _isLoading;

    Future<void> fetchUsers() async {
    _usuarios = await _apiService.fetchUsers();
    }
    Future<void> fetchUser(int? usersid) async {
      _isLoading = true;
      notifyListeners();
    usuarios = await _apiService.fetchUser(usersid);
    _isLoading = false;
      notifyListeners();
    }
    Future<bool> validateLogin() async {
      _isLoading = true;
      notifyListeners();
      await fetchUsers();
      final user = _usuarios.firstWhere(
        (u) => u.email == email && u.password == password,
        orElse: () => User(usersid: 0, email: '', password: '',name: '', lastname: ''),
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
    Future<int> saveUser() async {
      _isLoading = true;
      notifyListeners();
      int usersid = await _apiService.saveUser(User(usersid: 0, email: em, password: pass, name: name, lastname: lastname));
      // final user = _usuarios.firstWhere(
      //   (u) => u.email == email && u.password == password,
      //   orElse: () => User(usersid: 0, email: '', password: '',name: '', lastname: ''),
      // );
      _isLoading = false;
      notifyListeners();
      if (usersid != 0) {
        debugPrint("Registro correcto");
        return usersid;
      } else {
        debugPrint("Error");
        return 0;
      }
    }
    // ===========================
    Future<int> saveExpense() async {
      _isLoading = true;
      notifyListeners();
      int expensesid = await _apiService.saveExpense(Transaction(amount: amount, category: categoryname, description: description));
      // final user = _usuarios.firstWhere(
      //   (u) => u.email == email && u.password == password,
      //   orElse: () => User(usersid: 0, email: '', password: '',name: '', lastname: ''),
      // );
      _isLoading = false;
      notifyListeners();
      if (expensesid != 0) {
        debugPrint("Registro correcto");
        return expensesid;
      } else {
        debugPrint("Error");
        return 0;
      }
    }
}