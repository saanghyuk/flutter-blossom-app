

import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterModel{
  final int value;
  const CounterModel({required this.value});
  // 이름있는 생성자를 하나 더 만들어서 미리 초기화해놓을 생성자 하나 두면 쓰기 편하다.
  const CounterModel.zero(): value = 0;
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
}


class ProxyModel{
  // 부모꺼
  final int pValue;
  // 내꺼
  final String value;
  const ProxyModel({required this.pValue, required this.value});

}

class ProxyNotifier extends StateNotifier<ProxyModel>{
  final CounterNotifier counterNotifier;
  ProxyNotifier({required ProxyModel model, required this.counterNotifier}): super(model);

  void check(){
      this.counterNotifier.add();
      if(this.counterNotifier.state.value > 5){
        this.state = ProxyModel(pValue: this.counterNotifier.state.value, value: "5보다 크다");
      }
        // else {
      //   // this.state = ProxyModel(pValue: pValue, value: value)
      // }
  }


}


final counterProvider = StateNotifierProvider<CounterNotifier, CounterModel>(
        (ref) => CounterNotifier(model: CounterModel.zero())
);


final proxyCounterProvider = StateNotifierProvider<ProxyNotifier, ProxyModel>(
        (ref){
          // 부모가 갱신이 되면 나도 갱신이 되는 것.
          //
          // 부모 provider를 불러오고
          // logic을 쓰는건 아니니깐 read로 그냥 넣어준 것.
          // final counterNotifier = ref.read<CounterNotifier>(counterProvider.notifier);
          //
          print("Proxy Create");
          // add를 하면 여기도 watch를 하고 있으면 proxy create가 다시 돌지 않을까? watch하고 있는 대상은 logic을 watch하고 있는 것.
          // notifier를 가져온게 로직을 쓰겠다는 것. 그러니깐 logic을 watch하는 것.
          final counterNotifier = ref.watch<CounterNotifier>(counterProvider.notifier);
          // 갱신이 같이 일어나기를 바라면,
          final counterValue = ref.watch<CounterModel>(counterProvider);
          return ProxyNotifier(
              model: ProxyModel(
                  // 로직 객체의 초기화된 모델은 가져오는데 갱신되는 모델은 가져오지 못한 것
                  // pValue: counterNotifier.state.value,
                  // 값 자체를 watch로 가지고 온 것. 그러면 내 생각대로 watch하고 있는 곳에 notifylistner가 가져오니깐 proxyprovider가 도는 것.
                  // watch를 해 봤을때 그 동안 생각은 상태와 로직이 하나였다면, 이제는 그것을 두개로 분리하는 것.
                  // 로직을 watch한다고 갱신이 되지 않는다.
                  pValue : counterValue.value,
                  value: 'await'
              ),
              counterNotifier: counterNotifier);
        }
);


