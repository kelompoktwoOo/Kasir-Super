import 'package:flutter/material.dart';
import 'package:kelompoktwoo/controllers/auth/auth.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  final LoginController _loginController = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final result = await _loginController.login(
      context: context,
      email: email,
      password: password,
    );

    if(!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if(result) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading 
              ? const CircularProgressIndicator(color: Colors.purple,)
              : const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
              child: const Text('Tidak punya akun? Daftar disini'),
            ),
          ],
        ),
      ),
    );
  }
}