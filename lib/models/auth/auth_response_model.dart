import 'package:kelompoktwoo/models/user/user_model.dart';

class AuthResponseModel {
  final String? token;
  final User? user;

  AuthResponseModel({
    required this.token, 
    required this.user,
    });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'] as String?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user?.toJson(),
    };
  }
}