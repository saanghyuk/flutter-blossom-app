import 'package:blossom/project/models/authDataObject/authModel.dart';
import 'package:blossom/project/models/serviceModel.dart';

abstract class ServiceResponseModel<T> extends ServiceModel{
  int get getCode;
  T get getBody;

  // factory ServiceResponseModel.json(){
  //   return AuthSignInResponseModel(email: '', displayName: '', idToken: '', refreshToken: '', expiresIn: '')
  // }
}