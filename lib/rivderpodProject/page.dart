import 'package:blossom/rivderpodProject/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class SamplePage extends ConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 변수를 쓰는 것
    final state = ref.watch<CounterModel>(counterProvider); // state
    // 함수를 쓰는 것
    final logic = ref.read<CounterNotifier>(counterProvider.notifier); // logic



    // proxy state
    // 여기 read로 해보기
    final p_state = ref.watch<ProxyModel>(proxyCounterProvider);
    // proxy logic
    final p_logic = ref.read(proxyCounterProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: Text("${p_state.value} / ${p_state.pValue}"),
        actions: [
          IconButton(onPressed: p_logic.check, icon:Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Text(state.value.toString(), style: TextStyle(fontSize: 60.0))
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: logic.add,
      ),
    );
  }
}



