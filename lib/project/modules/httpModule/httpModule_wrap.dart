
import 'package:blossom/project/modules/httpModule/httpModule_interface.dart';

final class HttpModule extends HttpModuleInterface{

}

final class HttpModuleResponseModel extends HttpModuleResponseModelInterface{
  // http라는 이름있는 생성자가 정의만 되있으면 되는데 에러 안나게 하려고 넘기는 것
  // abstract, interface로 생성자가 강제가 안됨
  // 생성자가 강제가 안된다는 것은 생성자 이름이 바뀔 수 있다는 것이고, 그러면 안되는 것.
  HttpModuleResponseModel.http({required Response response}): super.http(response: response);
}