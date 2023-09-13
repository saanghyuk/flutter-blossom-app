
abstract class FirebaseDataModel{
  factory FirebaseDataModel.json(int code, Map<String,dynamic> json){
    if(code == 200) return FirebaseOkModel(name: json['name']);
    return FirebaseErrModel(errMsg: json['errMsg']);
  }
}

class FirebaseOkModel implements FirebaseDataModel{
  final String name;
  FirebaseOkModel({required this.name});
}

class FirebaseErrModel implements FirebaseDataModel{
  final String errMsg;
  FirebaseErrModel({required this.errMsg});
}
