import 'package:blossom/project/myProvider.dart';
import 'package:blossom/rivderpodProject/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// void main() {
//   runApp(MyProvider());
// }


// ProviderScope이 multiprovider 역할을 한다.
// 이 아래부터 provider를 사용하겠다는 뜻. provider는 이 하위에서 알아서 쓸 수 있다
void main() => runApp(ProviderScope(child: MaterialApp(home: SamplePage())));