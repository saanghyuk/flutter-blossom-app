import 'package:lanparser/lanparser.dart';

/// 이렇게 하면 LanParserModule만 import를 해도 아래 파일도 같이 나간다.
export 'package:lanparser/lanparser.dart';

class LanParserModule{
  static Lan stringToLen(String lan)
    => LanParser.stringToLan(lan);
}
