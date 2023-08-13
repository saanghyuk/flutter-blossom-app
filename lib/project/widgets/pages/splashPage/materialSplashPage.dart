import 'package:flutter/material.dart';

class MaterialSplashPage extends StatelessWidget {
  final String txt;
  const MaterialSplashPage({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              /// 비동기 로직을 넣을 떄 테스트하면 좋은
              /// 비동기 로직을 넣을때는 항상 Circular를 무조건 넣는다.
              CircularProgressIndicator(),
              Text(this.txt),
            ],
          ))
    );
  }
}
