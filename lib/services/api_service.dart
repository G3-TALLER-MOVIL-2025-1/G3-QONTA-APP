import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qonta_app/models/transaction.dart';
import '../models/user.dart';
import '../utils/user_preferences.dart';
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
  Future<List<User>> fetchUser(int? usersid) async {
    final response = await http.post(Uri.parse(
    'http://10.0.2.2:5000/api/users/getUserById'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{'usersid': usersid.toString()}),
    );
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  Future<int> saveUser(User users) async {
    final response = await http.post(Uri.parse(
    'http://10.0.2.2:5000/api/users/register'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{
        'name': users.name.toString(),
        'lastname': users.lastname.toString(),
        'email': users.email.toString(),
        'password': users.password.toString(),
        }),
    );
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      print(jsonData[0]['usersid']);
      return jsonData[0]['usersid'];
      // return jsonData.map((e) => User.fromJson(e)).toList();
      // print(json.decode(response.body));
      print("Registrado");
    } else {   
      if(response.statusCode == 409){
        return 0;
      }
      else {
      throw Exception('Error al cargar usuarios');
      }
    }
    } 
  Future<int> saveExpense(Transaction transaction) async {
    int? userid = UserPreferences.instance.preferences!.getInt('usersid');
    final response = await http.post(Uri.parse(
    'http://10.0.2.2:5000/api/categories/register'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{
        'userid': userid.toString(),
        'categoryname': transaction.category.toString(),
        'amount': transaction.amount.toString(),
        'description': transaction.description.toString(),
        }),
    );
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      print(jsonData[0]['expensesid']);
      return jsonData[0]['expensesid'];
      // return jsonData.map((e) => User.fromJson(e)).toList();
      // print(json.decode(response.body));
      print("Registrado");
    } else {   
      if(response.statusCode == 409){
        return 0;
      }
      else {
      throw Exception('Error al cargar usuarios');
      }
    }
    } 
  

}
