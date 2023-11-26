import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';
import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/providers/riverpod/loginPageNotifier.dart';
import 'package:blossom/project/services/mainService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageDataStateModel{
  final MainDataWrapModel? data;
  const MainPageDataStateModel({this.data});
}

class MainPageDataNotifier extends StateNotifier<MainPageDataStateModel> {
  LoginPageNotifier loginPageNotifier;
  final MainService _mainService = MainService();

  MainPageDataNotifier({
        required this.loginPageNotifier,
        required MainPageDataStateModel state}):super(state) {
    Future.microtask(this._init);
  }


  Future<void> _init() async {
    if(!this.loginPageNotifier.state.loginState) return;
    await this.fetch();

    /// 1 MainModel이 나올 거라고 확정을 지어 놓은 것.
    /// ResModel.MainModel(body)의 body 를 빼서 as MainPageResponseModel
    /// 2
    // ResModel(
    //   code: _body['code'],
    //   body: MainDataResponseModel.json(_body["body"])
    // )
    /// 의 body 를 빼서 as MainPageResponseModel
    /// 3
    ///  ResModel.json(_body);
    /// 의 body 를 빼서 as MainPageResponseModel
  }
  void clear(){
    this.state = const MainPageDataStateModel();
  }

  Future<void> fetch() async {
    final ResModel _data = await this._mainService.fetch();
    this.state = MainPageDataStateModel(data: _data.body as MainDataWrapModel);
  }
}


final mainPageDataRiverpod = StateNotifierProvider<MainPageDataNotifier, MainPageDataStateModel>(
  // watch로 해놓으면 계속 객체를 생성할꺼니깐, read
  // read로 변수만 들고 오는 것도 된다.
        (ref) => MainPageDataNotifier(
          // 위에서 체크만 하면 되니깐 그냥 Read로 들고 왔다. 변수만 들고 와도 된다.
          // if(!this.loginPageNotifier.state.loginState) return;
            loginPageNotifier: ref.read<LoginPageNotifier>(loginPageRiverpod.notifier),
            state: MainPageDataStateModel()
        )
);