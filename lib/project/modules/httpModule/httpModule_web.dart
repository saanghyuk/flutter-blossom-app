
import 'package:blossom/project/modules/httpModule/httpModule_interface.dart';
import 'package:http/http.dart' as http;

class HttpModuleCommon{

}


// 코드를 적을 떄 내보내는 것은 wrap
// wrap에 있는 것을 내보내면서 compile에 실제로 나가는 것.
final class HttpModule extends HttpModuleInterface{
  HttpModule._();
  static HttpModuleInterface instance = HttpModule._();


  @override
  Future<HttpModuleResponseModelInterface> get({required String uri, required Map<String, String>? headers})  async {
    return HttpModuleResponseModel.http(
        res: await http.get(
            Uri.parse(uri),
            headers:headers
        ));
  }

  @override
  Future<HttpModuleResponseModelInterface> post({required String uri, Map<String, String>? headers, Object? body})  async {
    // TODO: implement post
    return HttpModuleResponseModel.http(
        res: await http.post(
            Uri.parse(uri),
            headers:headers,
            body: body
        ));
  }
}

final class HttpModuleResponseModel extends HttpModuleResponseModelInterface{

  // http라는 이름있는 생성자가 정의만 되있으면 되는데 에러 안나게 하려고 넘기는 것
  // abstract, interface로 생성자가 강제가 안됨
  // 생성자가 강제가 안된다는 것은 생성자 이름이 바뀔 수 있다는 것이고, 그러면 안되는 것.
  // 결과적으로 강제는 안되고 내가 그냥 이름 잘 해야 되는 것.
  HttpModuleResponseModel.http({required Response res}):super.http(response: res);

  @override
  // TODO: implement body
  String get body => super.body;

  @override
  // TODO: implement statusCode
  int get statusCode => super.statusCode;
/// ab, interface 등으로 생성자 이름이 강제가 안됨 -> 작성 규칙을 만듦
}