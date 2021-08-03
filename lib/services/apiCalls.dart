import 'package:http/http.dart' as http;
import 'dart:convert';


class APICalls {
  Future<void> registerEmployee(String name, String email, String password,
      String passwordConfirmation) async {
    var url = Uri.parse('');
    var body = json.encode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation
    });

    var response = await http.put(url, body: body);
    if(response.statusCode==100){}else{
      throw Exception('Registration failed...');
    }
  }

  Future signInEmployee(String email, String password) async {
    var url = Uri.parse('');
    var body = json.encode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url,body: body);


  }

  Future getEmployees() async {
    var url = Uri.parse('');
    final response = await http.get(url);
  }
}
