import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_octohub/data/registration_model.dart';

class ApiService {
  Future<void> register(RegistrationRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://prime.finobooks.com/api/MasterUserCompanyRegister/addAdmin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );
      print(
          'status code :- ${response.statusCode} bod --------- ${response.body}');
      if (response.statusCode != 200) {
        throw Exception('Registration failed');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
