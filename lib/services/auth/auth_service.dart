import 'package:kelompoktwoo/middlewares/storage_service.dart';
import 'package:kelompoktwoo/models/model.dart';
import 'package:kelompoktwoo/services/api/api_service.dart';

class AuthService {
  final ApiService apiService = ApiService();
  final StorageService storageService = StorageService();

  Future<AuthResponseModel?> registerUser(String username, String email, String password) async {
    final result = await ApiService.register(username, email, password);
    if (result['success']) {
      final message = result['message'];
      return message;
    }
    return null;
  }

  Future<AuthResponseModel?> loginUser(String email, String password) async {
    final result = await ApiService.login(email, password);
    if (result['success']) {
      final token = result['data']['token'];
      final user = User.fromJson(result['data']['user']);
      await saveToken(token);
      return AuthResponseModel(token: token, user: user);
    }
    return null;
  }

  Future<AuthResponseModel?> getUserProfile() async {
    final token = await getToken();
    if (token != null) {
      final result = await ApiService.getUserProfile(token);
      if (result['success']) {
        final user = User.fromJson(result['data']['user']);
        return AuthResponseModel(token: token, user: user);
      }
    }
    return null;
  }

  Future<void> saveToken(String token) async {
    await StorageService.writeSecureData('token', token);
  }

  Future<String?> getToken() async {
    return await StorageService.readSecureData('token');
  }

  Future<void> deleteToken() async {
    await StorageService.deleteSecureData('token');
  }
}