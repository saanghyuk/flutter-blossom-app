
/// 이렇게 하면 LanParserModule만 import를 해도 아래 파일도 같이 나간다.

class LanParserModule{
  static Lan stringToLen(String lan)
    => LanParser.stringToLan(lan);
}


enum Lan{
  KO,
  US,
  CN,
  ERR
}

class LanParser {
  static Lan stringToLan(String lan){
    if(lan == "KO" || lan == "KR") return Lan.KO;
    if(lan == "US") return Lan.US;
    if(lan == "CN") return Lan.CN;
    return Lan.ERR;
  }
}


