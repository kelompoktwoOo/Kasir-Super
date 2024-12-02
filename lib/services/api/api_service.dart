import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kelompoktwoo/services/config/api.dart';

class ApiService {
  static const String baseUrl = Api.baseUrl;

  // Register User
  static Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/register');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': username, 
      'email': email, 
      'password': password
      }
    );

    try{
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201){
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'message': responseData['message'],
        };
      } else {
        return {
          'success': false, 
          'message': jsonDecode(response.body)
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect to the server'};
    }
  }

  // Login User
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email, 
      'password': password
      }
    );
    
    try{
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200){
        return {
          'success': true, 
          'data': jsonDecode(response.body),
          'token': jsonDecode(response.body)['token']
        };
      } else {
        return {
          'success': false, 
          'message': jsonDecode(response.body)
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect to the server'};
    }
  }

  // Get User Profile
  static Future<Map<String, dynamic>> getUserProfile(String token) async {
    final url = Uri.parse('$baseUrl/auth/profile');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    
    try{
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200){
        return {'success': true, 'data': jsonDecode(response.body)};
      } else {
        return {'success': false, 'message': jsonDecode(response.body)};
      }
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect to the server'};
    }
  }
}