import 'package:http/http.dart' as http;
export 'package:http/http.dart';
class HttpModuleInterface{
  // interface로 잡으나, static을 잡을 수가 없어서 일반 클래스로 씀
  static Future<HttpModuleResponseModelInterface> get({
    required String uri,
    required Map<String, String>? headers
  }) async {
    throw "Interface";
  }

  static Future<HttpModuleResponseModelInterface> post({
    required String uri,
    Map<String, String>? headers,
    Object? body
  }) async {
    throw "Interface";
  }
}



/// 원래 썼던 Interface, abstract가 써도 생성자 이름을 강제할 수가 없으니깐,
/// 일단 클래스로 만들어서 노출되게 하는 것.
/// 상황 정리
/// 여기서 인터페이스로 만들고 싶었다.
/// 1. 그런데 자식에서(httpModule_wrap.dart) 쓸 때(implements를 해도) 이름있는 생성자에 대한 오버라이딩이 강제되지 않는다.
/// 2. 그럼 abstract로 바꾸고 http를 factory로 바꾸면? 오버라이딩을 한다고 해도 httpModule_app, _web 중에 누구를 뱉어줘야 될지를 모른다.
/// 3. 그러면? 일반 클래스로 놓고 아래서 생성자에서 super를 쓰게 해준다. => 그래야 생성자 오버라이딩 할때 super로 이걸 만들어줄 수 있으니깐
///
/// abstract interface
class HttpModuleResponseModelInterface{
  final String body;
  final int statusCode;

  // // const를 넣으면 확정적으로 불변이 되야 되는데, res.body, res.statusCode가 변할 수 있으니깐 안된다.
  HttpModuleResponseModelInterface.http({
    required http.Response response}): body = response.body, statusCode = response.statusCode;
}