import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel{
  final int value;
  const CounterModel({required this.value});

  // 이름있는 생성자를 하나 더 만들어서 미리 초기화해놓을 생성자 하나 두면 쓰기 편하다.
  const CounterModel.zero(): value = 0;
}

class ProxyModel {
  final int pValue;
  final String value;
  const ProxyModel({required this.pValue, required this.value});
}

class CounterNotifier extends StateNotifier<CounterModel>{

  // state를 직접 만들 수 없다.
  // superstate를 이용해야 한다.
  // 변경은 state setter로 제어한다.
  CounterNotifier({required CounterModel model}): super(model);
  void add(){
    // this.state에 CounterModel이 들어있는 것
    // this.state.value += 1; 이렇게 쓰면 안된다.
    // notifylistner를 호출할 수 없다.
    this.state = CounterModel(value: this.state.value+1);
  }
  void substract(){
    this.state = CounterModel(value: this.state.value-1);
  }

}


class ProxyNotifier extends StateNotifier<ProxyModel>{
  // @TODO 왜 여기서 notifier를 가지고 오는가?
  // @TODO 단지 add를 쓰려고 인가? 그렇다면 값만 쓸거였으면 필요 없는건가?
  // => 값만 쓰는 것이면 값만 받으면 된다. 함수를 받기 위해서 notifier한 것
  final CounterNotifier counterNotifier;
  ProxyNotifier({required ProxyModel model, required this.counterNotifier}): super(model);

  void check(){
    this.counterNotifier.add();
    if (this.counterNotifier.state.value > 5){
      this.state = ProxyModel(pValue: this.counterNotifier.state.value, value: "5보다 크다");
    }
  }
  void add(){
    this.state = ProxyModel(pValue: this.state.pValue + 1, value: "가나다라마바사");
  }
}




// Provider 생성할 때
// proxy는 상위에서 뭔가 수정됬을 때
// 상위의 notifier가 호출됬다는 것.
final counterProvider = StateNotifierProvider<CounterNotifier, CounterModel>(
        (ref){
          print("Created");
          return CounterNotifier(model: CounterModel.zero());
        }
);



final proxyCounterProvider = StateNotifierProvider<ProxyNotifier, ProxyModel>(
        (ref){

          // 부모가 갱신이 되면 나도 갱신이 되는 것.
          // 부모 provider를 불러오고
          // logic을 쓰는건 아니니깐 read로 그냥 넣어준 것.
          // final counterNotifier = ref.read<CounterNotifier>(counterProvider.notifier);

          print("Proxy Created");
          final counterNotifier = ref.watch<CounterNotifier>(counterProvider.notifier);
          final counterValue = ref.watch<CounterModel>(counterProvider);
          return ProxyNotifier(
              model: ProxyModel(
                pValue: counterValue.value,
                value: "await"),
              counterNotifier: counterNotifier
          );
        }
);