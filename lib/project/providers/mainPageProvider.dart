



import 'package:flutter/foundation.dart';

class MainPageProvider with ChangeNotifier{

  // GETTER
  bool ignore = false;
  double opacity = 1.0;

  // GETTER/SETTER
  double height = 0;
  double? baseHeight;
  setBaseHeight(double height){
    this.baseHeight = height;
    this.height = height;
    // this.notifyListeners();
  }

  void event(double scrollHeight){
    if(scrollHeight >= 100){
      if(!this.ignore){
        this.ignore = true;
      }
      if(height != 0) {
        height -= 5;
      }
    } else {
      if(this.ignore){
        ignore = false;
      }
      if(height <= baseHeight!){
        height = (height + 5 <= baseHeight!) ? height + 5 : baseHeight!;
      }
    }
    print(scrollHeight);
    this.notifyListeners();
  }

}