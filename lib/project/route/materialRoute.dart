import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:blossom/project/pages/loginPage/loginPage.dart';
// import 'package:blossom/project/pages/mainpage/mainPage.dart';
import '../pages/mainPage/mainPage_exports.dart';
import 'package:blossom/project/pages/splashpage/splashPage.dart';
import 'package:blossom/project/providers/searchProvider.dart';
import 'package:blossom/project/widgets/pages/searchPage/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectMaterialRoute extends StatelessWidget {
  const ProjectMaterialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// M2 디자인
      theme: ThemeData(useMaterial3: false),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings route){
        // search => /search?q=""
        if(route.name!.indexOf("/search") != -1 ){
          Map<String, dynamic> _qs = this._parse(route.name!);
          final _model = QsModel.json(json: _qs);
          if(_model.q != null){
            context.read<SearchProvider_G>().setLog(_model.q!);
          }
          /// provider1 - 전역으로 검색 기록 확인할때, provider2 - 지역으로 써서 검색만 할때 쓰기 위해서. MaterialApp보다 밑에서 아래처럼 쓰면 된다.
          /// context.read<P1>.add(data) // .pushServer(data)
          /// build함수가 갱신이 되야되면 watch, 아니면 read

          return MaterialPageRoute(
              settings: RouteSettings(name: route.name),
              builder: (_) => SearchPage.builder(_model),
          );

        }


        if(route.name == LoginPage.path) return MaterialPageRoute(
            builder: LoginPage.builder,
            settings: LoginPage.settings
        );

        if(route.name == MainPage.path){
          return MaterialPageRoute(settings: MainPage.settings, builder: MainPage.builder);
        }
        return MaterialPageRoute(
          settings: SplashPage.settings,
          builder: SplashPage.builder,
        );
      },
    );



  }
  Map<String, dynamic> _parse(String path){
    // +@검증
    // {q: a};
    List<String> _sp = path.split("?");
    if(_sp.length == 1) return {"q": null};

    String _s = path.split("?")[1];
    List<String> _q = _s.split("=");
    return {_q[0]: _q[1]};
  }
}