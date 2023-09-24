import 'package:blossom/project/models/authDataObject/authModel.dart';
import 'package:blossom/project/models/serviceResponseModel.dart';

abstract class AuthDataModel{
  /// 상위 객체의 factory에서 하위 객체를 만들려면 상하관계가 implements여야 한다.
  factory AuthDataModel.json(Map<String, dynamic> json){
    if(json['authType'] == 'Firebase'){
      /// {} // {...}
      if(json.length == 1){
        return FirebaseAuthDataErrModel();
      }
      return FirebaseAuthDataOkModel(json: json);
    } else {
      return GoogleAuthDataModel();
    }
  }

  factory AuthDataModel.authCheck(bool check){
    return AuthCheckModel(check: check);
  }
}


final class AuthCheckModel implements AuthDataModel{
  final bool check;
  const AuthCheckModel({required this.check});
}

final class FirebaseAuthDataModel implements AuthDataModel{

}

final class FirebaseAuthDataOkModel extends FirebaseAuthDataModel{
  final String email;
  final String displayName;
  final String idToken;
  final String refreshToken;
  final String expiresIn;
  FirebaseAuthDataOkModel({required Map<String, dynamic> json})
    :email = json['email'].toString(),
    displayName = json['displayName'].toString(),
    idToken = json['idToken'].toString(),
    refreshToken = json['refreshToken'].toString(),
    expiresIn = json['expiresIn'].toString();

}

final class FirebaseAuthDataErrModel extends FirebaseAuthDataModel{

}



final class GoogleAuthDataModel implements AuthDataModel{}


/// ServiceResponseModel<AuthDataModel>
/// Stateful에서 이런식으로 썼다.
final class AuthResponseModel extends ServiceResponseModel<AuthDataModel>{


  @override
  // TODO: implement body
  AuthDataModel get getBody => this.body;

  @override
  // TODO: implement code
  int get getCode => this.code;

  final int code;
  final AuthDataModel body;
  AuthResponseModel({
    required this.code,
    required this.body
  });


  factory AuthResponseModel.json(Map<String, dynamic> json){

      return AuthResponseModel( /// T 안 적혀 있으면
          code: json['code'],
          /// T 객체고 클래스고 그런게 아니라 타입으로 보니깐, 추론이 뭘 해도 안되네.
          /// 제네릭은 오직 타입일 뿐, 추론이 안된다. 타입체크를 한다거나 그런 것만 되고, 실제로 객체, 클래스로 쓰는 건 안된다.
          body: AuthDataModel.json(json['body']) /// 모델링 필요
      );
  }

  factory AuthResponseModel.authCheck(Map<String, dynamic> json){
    return AuthResponseModel(
        code: json['code'],
        body: AuthDataModel.authCheck(json['body']));
  }


}




