part of 'auth.dart';

class RegisterController {
  final AuthService _authService = AuthService();

  Future<bool> register({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await _authService.registerUser(username, email, password);

    if(!context.mounted) return false;

    if(result != null) {
      MessageOverlay.show(context, 'Registration successful!');
      return true;
    } else {
      MessageOverlay.show(context, 'Registration failed. Try again.');
      return false;
    }
  }
}