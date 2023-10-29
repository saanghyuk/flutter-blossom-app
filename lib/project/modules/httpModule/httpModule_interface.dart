import 'package:http/http.dart' as http;
export 'package:http/http.dart';


/// 구현코드들의 교집합 정도로 추상화 한다.
/// just 이 클래스 저 클래스에 똑같이 들어있는 변수나 함수를 들고있는 정도로 하고 너무 복잡하게 생각하지 않는다.
/// app, web에 나온 정의들만 따로 분류해놓은 클래스라고 생각하면 된다.
/// wrap <> web/app 을 어떻게든 분리해서 관리하기 위해서 interface를 만들어 놓은 것.

// 하위클래스에서 동작할 내용들을 미리 적어놓으려고
// app, web에서 쓸 애들을 미리 정의한 것.

abstract class HttpModuleInterface{
  // interface로 잡으나, static을 잡을 수가 없어서 일반 클래스로 씀
  Future<HttpModuleResponseModelInterface> get({
    required String uri,
    required Map<String, String>? headers
  });
  Future<HttpModuleResponseModelInterface> post({
    required String uri,
    Map<String, String>? headers,
    Object? body
  });
}



/// 원래 썼던 Interface, abstract가 써도 생성자 이름을 강제할 수가 없으니깐,
/// 일단 클래스로 만들어서 노출되게 하는 것.
/// 상황 정리
/// 여기서 인터페이스로 만들고 싶었다.
/// 1. 그런데 자식에서(httpModule_wrap.dart) 쓸 때(implements를 해도) 이름있는 생성자에 대한 오버라이딩이 강제되지 않는다.
/// 2. 그럼 abstract로 바꾸고 http를 factory로 바꾸면? 오버라이딩을 한다고 해도 httpModule_app, _web 중에 누구를 뱉어줘야 될지를 모른다.
/// 3. 그러면? 일반 클래스로 놓고 아래서 생성자에서 super를 쓰게 해준다. => 그래야 생성자 오버라이딩 할때 super로 이걸 만들어줄 수 있으니깐
/// 4. abstract, interface를 쓰든 이름있는 생성자 혹은 factory를 같은 이름의 자식으로 강제할 수 없고, -> 자식에서 이름을 바꿔서 가져갈 수 있고 -> 그러니깐 고민했던 것.
/// 5. 돌고 돌아서 일반 클래스로 간 것.
/// 6. 이거는 이 상황이 아니여도 안된다.언어 자체가 안되는 것.
/// 7. 일반 클래스를 써도 강제가 안되는 것. 뭘 써도 강제가 안되는 것.
/// abstract interface
abstract class HttpModuleResponseModelInterface{
  final String body;
  final int statusCode;

  // // const를 넣으면 확정적으로 불변이 되야 되는데, res.body, res.statusCode가 변할 수 있으니깐 안된다.
  HttpModuleResponseModelInterface.http({
    required http.Response response}): body = response.body, statusCode = response.statusCode;
}