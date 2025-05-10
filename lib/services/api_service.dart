import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qonta_app/models/transaction.dart';

class ApiService {

  Future<List<Transaction>> fetchTransactions() async{
    final response = await http.get(
      Uri.parse(""),
    );
    if(response.statusCode == 200){
      final List data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    }
    else{
      throw Exception('Error al cargar trasacciones');
    }
  }

}
