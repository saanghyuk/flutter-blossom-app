import 'package:flutter/foundation.dart';

class MainPageProvider with ChangeNotifier{

  // GETTER
  bool ignore = false;
  double opacity = 1.0;

  // GETTER/SETTER
  double? height;
  double? baseHeight;
  double _addValue = 10.0;

  void setBaseHeight(double height){
    this.baseHeight = height;
    this.height = height;
    // this.notifyListeners();
  }

  void event(double scrollHeight, bool isReverse){
    if(scrollHeight > 500.0 && isReverse){
      if(!this.ignore){
        this.ignore = true;
      }
      if(this.height! > this._addValue){
        this.height = this.height! -this._addValue;
      }
    } else {
      if(this.ignore){
        this.ignore = false;
      }
      if(this.height! < this.baseHeight!){
        this.height = this.height! + this._addValue;
      }
    }

    this.notifyListeners();

  //   if(scrollHeight >= 100){
  //     if(!this.ignore){
  //       this.ignore = true;
  //     }
  //     if(height != 0) {
  //       height -= 1;
  //     }
  //   } else {
  //     if(this.ignore){
  //       ignore = false;
  //       if(height <= baseHeight!){
  //         height += 1;
  //       }
  //     }
  //   }
  //   print(scrollHeight);
  //   this.notifyListeners();
  }

}