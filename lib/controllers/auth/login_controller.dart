part of 'auth.dart';

class LoginController {
  final AuthService _authService = AuthService();

  Future<bool> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final result = await _authService.loginUser(email, password);

    if(!context.mounted) return false;

    if(result != null) {
      MessageOverlay.show(context, 'Login successful!');
      return true;
    } else {
      MessageOverlay.show(context, 'Login failed. Try again.');
      return false;
    }
  }
}