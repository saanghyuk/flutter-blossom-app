// 실제로 쓸때는 어디선가 사용할때는 무조건 이 파일을 임포트 해야 한다.
// 이 파일을 불러가면, wrap.dart같이 export한다는 것.
// wrap.dart는 오류가 났을 때 반환하는 파일이라고 생각하면 되는데, 지금 상황에서는 발생할 수 없다.
// dart.library.io 런타임 단계에서 dart sdk에 html파일이나 io파일이 존재하는지를 판단하는 것.

export './wrap.dart'
  // 앱으로 실행 시
  if(dart.library.io) './mainPage_app.dart'
  // 웹으로 실행 시
  if(dart.library.html) './mainPage_web.dart';
