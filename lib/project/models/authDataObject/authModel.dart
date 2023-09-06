

import 'dart:convert';

class AuthModel{}

final class AuthSignInModel{
  final String email;
  final String password;
  const AuthSignInModel({
    required this.email,
    required this.password});


  @override
  Map<String, String> toMap() => {"email": this.email, "password": this.password};

  @override
  String toString() => "{email: ${this.email}, password: ${this.password}}";

  String toBody() => json.encode(this.toMap());

}

final class AuthSignInResponseModel{
  final String email;
  final String displayName;
  final String idToken;
  final String refreshToken;
  final String expiresIn;
  const AuthSignInResponseModel({
          required this.email,
          required this.displayName,
          required this.idToken,
          required this.refreshToken,
          required this.expiresIn});

  factory AuthSignInResponseModel.json({required Map<String, dynamic> json}){
    return AuthSignInResponseModel(
        email: json['email'].toString(),
        displayName: json['displayName'].toString(),
        idToken: json['idToken'].toString(),
        refreshToken: json['refreshToken'].toString(),
        expiresIn: json['expiresIn'].toString(),
    );
  }

}