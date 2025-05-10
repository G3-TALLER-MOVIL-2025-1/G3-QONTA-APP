import 'package:flutter/material.dart';
import 'package:qonta_app/models/transaction.dart';
import '../services/api_service.dart';

class SearchViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Transaction> all = [];
  List<Transaction> filtered = [];
  bool isLoading = true;

  Future<void> loadTransactions() async {
    isLoading = true;
    notifyListeners();
    try{
      all = await _apiService.fetchTransactions();
      filtered = all;
    } catch(_) {
      filtered = [];
    }
    isLoading = false;
    notifyListeners();
  }

}