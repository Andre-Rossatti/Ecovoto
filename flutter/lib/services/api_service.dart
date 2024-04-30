import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://seu-endereco-api.com/api';

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/users/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'senha': password,
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Login successful, token: ${data['token']}');
        // Aqui você pode salvar o token no dispositivo para sessões futuras
        return true;
      } else {
        print('Failed to login: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }
}