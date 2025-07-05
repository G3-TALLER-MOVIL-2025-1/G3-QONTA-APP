import 'package:flutter/material.dart';
import 'package:qonta_app/models/transaction.dart';
import '../services/api_service.dart';
import 'package:camera/camera.dart';

class SearchViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Transaction> all = [];
  List<Transaction> filtered = [];
  bool isLoading = false;
  
  Future<void> fetch(int? usersid) async {
    all = await _apiService.fetchTransactions(usersid);
    }

  Future<void> loadTransactions(int? usersid) async {
    isLoading = true;
    notifyListeners();
    try{
      print("load"+usersid.toString());
      // all = await _apiService.fetchTransactions(usersid);
      await fetch(usersid);
      print("abcde");
      print(all);
      print(all[0].amount);
      print(all[0].category);
      print(all[0].date);
      // print(all[0].description);
      filtered = all;
    } catch(e) {
      print(e);
      print("asfsdafds");
      filtered = [];
    }
    isLoading = false;
    notifyListeners();
  }

  Future<double> getAmount(XFile picture) async {
    isLoading = true;
    double amountFromOCR = double.parse(await _apiService.getAmountFromImage(picture!));
    isLoading = false;
    return amountFromOCR;
  }

}