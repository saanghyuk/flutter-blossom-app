import 'package:http/http.dart' as http;
/// dio로 바꿔보면서 수정이 얼마나 들어가야되는지 연습해 보는 것이 중요하다.
class HttpModuleResponseModel{
  final String body;
  final int statusCode;

  // const를 넣으면 확정적으로 불변이 되야 되는데, res.body, res.statusCode가 변할 수 있으니깐 안된다.
  HttpModuleResponseModel.http({
    required http.Response response}):
        body = response.body, statusCode = response.statusCode;
}


final class HttpModule{
    static Future<HttpModuleResponseModel> get({
      required String uri,
      required Map<String, String>? headers
    }) async {
      final http.Response _res = await http.get(Uri.parse(uri), headers: headers);
      return HttpModuleResponseModel.http(response: _res);
  }

    static Future<HttpModuleResponseModel> post({
        required String uri,
        Map<String, String>? headers,
        Object? body
      }) async => HttpModuleResponseModel.http(response: await http.post(
            Uri.parse(uri),
            headers: headers,
            body: body
    ));
}