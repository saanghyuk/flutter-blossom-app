



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

    if(scrollHeight > 100.0){
      if(!this.ignore) {
        this.ignore = true;
      }
      if(this.height != 0){
        this.height -= 1;
      }
    } else {
      if(this.ignore){
        this.ignore= false;
        if(height <= this.baseHeight!){
          this.height = this.height! +1;
        }
      }
    }
    this.notifyListeners();
  }

}