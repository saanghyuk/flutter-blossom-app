import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainPageStateModel{
  final bool ignore;
  final double opacity;
  final double? height;
  final double? baseHeight;
  const MainPageStateModel({
    this.ignore = false,
    this.opacity = 1.0,
    this.height,
    this.baseHeight});

}

class MainPageNotifier extends StateNotifier<MainPageStateModel>{
  MainPageNotifier(super.state);
  final double _addValue = 10.0;
  void setBaseHeight(double height){
    this.state = MainPageStateModel(
        baseHeight : height,
        height : height,
      opacity: this.state.opacity,
      ignore: this.state.ignore,
    );
    // this.notifyListeners();
  }


  void event(double scrollHeight, bool isReverse){
    // 내려갈때 isReverse = true;
    if(scrollHeight > 500.0 && isReverse){
      print("${scrollHeight} + ${isReverse}");
      if(!this.state.ignore){
        this.state = MainPageStateModel(
          ignore: true,
          baseHeight: this.state.baseHeight,
          height: this.state.height,
          opacity: this.state.opacity
        );
      }
      if(this.state.height! > this._addValue){
        // this.height = this.height! - this._addValue;
        this.state = MainPageStateModel(
            ignore: this.state.ignore,
            baseHeight: this.state.baseHeight,
            height: this.state.height! - this._addValue,
            opacity: this.state.opacity
        );
      }
    } else {
      print("${scrollHeight} + ${isReverse}");
      if(this.state.ignore){
        this.state = MainPageStateModel(
            ignore: false,
            baseHeight: this.state.baseHeight,
            height: this.state.height,
            opacity: this.state.opacity
        );
      }
      if(this.state.height! < this.state.baseHeight!){
        this.state = MainPageStateModel(
            ignore: this.state.ignore,
            baseHeight: this.state.baseHeight,
            height: this.state.height! + this._addValue,
            opacity: this.state.opacity
        );
      }
    }
  }
}



final mainPageRiverpod = StateNotifierProvider<MainPageNotifier, MainPageStateModel>(
        (ref) => MainPageNotifier(MainPageStateModel())
);