import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qonta_app/models/transaction.dart';
import '../models/user.dart';
class ApiService {

  Future<List<Transaction>> fetchTransactions(int? usersid) async{
    print(usersid);
    final response = await http.post(
      Uri.parse("http://10.0.2.2:5000/api/expenses/getAllExpenses"),
      headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{'usersid': usersid.toString()}),
    );
    if(response.statusCode == 200){
      final List data = json.decode(response.body);
      print(data);
      return data.map((json) => Transaction.fromJson(json)).toList();
    }
    else{
      throw Exception('Error al cargar trasacciones');
    }
  }

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(
    'http://10.0.2.2:5000/api/users/getAllUsers'));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

}
