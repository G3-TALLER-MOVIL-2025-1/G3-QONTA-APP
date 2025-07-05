import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qonta_app/models/category.dart';
import 'package:qonta_app/models/transaction.dart';
import 'package:qonta_app/models/profile.dart';
import '../models/user.dart';
import '../utils/user_preferences.dart';
import 'package:dio/dio.dart';
import 'package:camera/camera.dart';
//for File
import 'dart:io';
class ApiService {
// http://10.0.2.2:5000
  Future<List<Transaction>> fetchTransactions(int? usersid) async{
    print(usersid);
    final response = await http.post(
      Uri.parse("https://g3-qonta-api-1.onrender.com/api/expenses/getAllExpenses"),
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
    'https://g3-qonta-api-1.onrender.com/api/users/getAllUsers'));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }
  // NEW METHOD
  Future<int> fetchUsersLogin(String email, String password) async {
    final response = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/users/login'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      // List jsonData = json.decode(response.body);
      // return jsonData.map((e) => User.fromJson(e)).toList();
      return json.decode(response.body)['usersid'];
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }
  Future<List<User>> fetchUser(int? usersid) async {
    final response = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/users/getUserById'),
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
    'https://g3-qonta-api-1.onrender.com/api/users/register'),
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
    if (response.statusCode == 201) {
      // List jsonData = json.decode(response.body);
      // print(jsonData[0]['usersid']);
      return json.decode(response.body)['usersid'];
      // return jsonData.map((e) => User.fromJson(e)).toList();
      // print(json.decode(response.body));
      // print("Registrado");
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
    'https://g3-qonta-api-1.onrender.com/api/categories/register'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String?>{
        'userId': userid.toString(),
        'categoryName': transaction.category.toString(),
        'color': null,
        // 'amount': transaction.amount.toString(),
        // 'description': transaction.description.toString(),
        }),
    );
    if (response.statusCode == 201) {
      // print(json.decode(response.body));
      // List jsonData = json.decode(response.body);
      // print(json.decode(response.body)['message']);
      // print(json.decode(response.body)['USERSID']);
      // print("AAAAAAAAAAAAAAA");
      int categoryid = json.decode(response.body)['categoryId'];
      print(categoryid);
       final response2 = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/expenses/register'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String?>{
        'userid': userid.toString(),
        'categoryid': categoryid.toString(),
        'amount': transaction.amount.toString(),
        'description': transaction.description.toString(),
        }),
    );
    print(json.decode(response2.body)['expenseId']);
    // if (response.statusCode == 201) {
      return json.decode(response2.body)['expenseId'];
      
    // }else{
      // print("Gasto no registrado");
    // }
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
  
    Future<ProfileData> fetchProfileData(int? usersid) async {
    final response = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/expenses/getProfileData'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String>{'usersid': usersid.toString()}),
    );
    if (response.statusCode == 200) {
      // List jsonData = json.decode(response.body);
      // return jsonData.map((e) => ProfileData.fromJson(e)).toList();
      print(response.body);
      print(json.decode(response.body));
      return ProfileData.fromJson(json.decode(response.body));
      // return json.decode(response.body);
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }
  //USE IT FOR OCR ONLY
 Future<int> saveExpenseFromOCR(Transaction transaction, String? categoryid) async {
    int? userid = UserPreferences.instance.preferences!.getInt('usersid');
    final response = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/expenses/register'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String?>{
        'userid': userid.toString(),
        // 'categoryname': transaction.category.toString(),
        // 'categoryid': transaction.category.toString(),
        'categoryid': categoryid,
        'amount': transaction.amount.toString(),
        'description': transaction.description.toString(),
        // 'date': transaction.date.toString(),
        }),
    );
    if (response.statusCode == 201) {
      // print(json.decode(response.body));
      // List jsonData = json.decode(response.body);
      // print(json.decode(response.body)['message']);
      // print(json.decode(response.body)['USERSID']);
      // print("AAAAAAAAAAAAAAA");
      return json.decode(response.body)['expenseId'];
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
    // USE IT FOR GET AMOUNT  
   Future<String> getAmountFromImage(XFile picture) async {
    int? userid = UserPreferences.instance.preferences!.getInt('usersid');
    // final map = <String, dynamic>{};
    // map['image'] = image;
    // final response = await http.post(Uri.parse(
    // 'https://g3-qonta-api-1.onrender.com/api/ocr/scanImageWithOCR'),
    // // headers: {
    // //   "Accept": "application/json",
    // //   "content-type":"application/json"
    // //   },
    //   body: formdata,
    String amount = "0";
    //     // jsonEncode(<String, String>{
    //     // 'userid': userid.toString(),
    //     // 'categoryname': transaction.category.toString(),
    //     // 'amount': transaction.amount.toString(),
    //     // 'description': transaction.description.toString(),
    //     // 'date': transaction.date.toString(),
    //     // }),
    // );
    final url =
        'https://g3-qonta-api-1.onrender.com/api/ocr/scanImageWithOCR';
    try {
      print("CCCCCCCCCCC");
      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(picture.path),
      });
      print("FFFFFFFFFF");
      final response = await Dio().post(
        url,
        data: formData,
      );
      print("BBBBBBBBB");
      print(response.statusCode);
      if (response.statusCode == 200) {
        var map = response.data as Map;
        print(response.data);
        print('success');
        return response.data["amount"].toString();
      } else {
        //BotToast is a package for toasts available on pub.dev
        // BotToast.showText(text: 'Error');
        print("AAAAAAA");
        return amount;
      }
    } on DioException catch (error) {
      print(error.message);
      // throw YourException(error);
    } catch (_) {
      // print(_.toString());
      throw 'Something Went Wrong';
    }

    return amount;
   
    // if (response.statusCode == 200) {
    //   // print(json.decode(response.body));
    //   // List jsonData = json.decode(response.body);
    //   // print(json.decode(response.body)['message']);
    //   // print(json.decode(response.body)['USERSID']);
    //   // print("AAAAAAAAAAAAAAA");
    //   return json.decode(response.body)['amount'];
    //   // return jsonData.map((e) => User.fromJson(e)).toList();
    //   // print(json.decode(response.body));
    //   print("Registrado");
    // } else {   
    //   if(response.statusCode == 409){
    //     return 0.toString();
    //   }
    //   else {
    //   throw Exception('Error al extraer cantidad');
    //   }
    // }
    }
    Future<List<Category>> getCategories() async {
    int? userid = UserPreferences.instance.preferences!.getInt('usersid');
    final response = await http.post(Uri.parse(
    'https://g3-qonta-api-1.onrender.com/api/categories/getAllCategoriesByUser'),
    headers: {
      "Accept": "application/json",
      "content-type":"application/json"
      },
      body: jsonEncode(<String, String?>{
        'userId': userid.toString(),
        // 'categoryName': transaction.category.toString(),
        // 'color': null,
        // 'amount': transaction.amount.toString(),
        // 'description': transaction.description.toString(),
        }),
    );
    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      // List jsonData = json.decode(response.body);
      // print(json.decode(response.body)['message']);
      // print(json.decode(response.body)['USERSID']);
      // print("AAAAAAAAAAAAAAA");
    List jsonData = json.decode(response.body);
    return jsonData.map((e) => Category.fromJson(e)).toList();
    // if (response.statusCode == 201) {
      
      
    // }else{
      // print("Gasto no registrado");
    // }
      // return jsonData.map((e) => User.fromJson(e)).toList();
      // print(json.decode(response.body));
      print("Registrado");
    } 
    // else {   
    //   if(response.statusCode == 409){
    //     // return 0;
    //   }
      else {
      throw Exception('Error al obtener categorias');
      }
    // }
    }  
}
