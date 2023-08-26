class AuthModel{

}

final class AuthSignInModel{
  final String email;
  final String password;
  const AuthSignInModel({
    required this.email,
    required this.password});

  // toString() override
  // or toJson()
  @override
  String toString() {
    // TODO: implement toString
    return "{email: ${this.email}, password: ${this.password}";
  }

  Map<String, String> toMap(){
    return {"email": this.email, "password": this.password};
  }

}

final class AuthSignInResponseModel{
  final String localId;
  final String email;
  final String displayName;
  final String registered;
  final String refreshToken;
  final String expiresIn;
  const AuthSignInResponseModel({
        required this.localId,
        required this.email,
        required this.registered,
        required this.refreshToken,
        required this.expiresIn,
        required this.displayName});

}