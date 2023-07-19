import 'package:flutter/material.dart';

class MaterialMainPage extends StatelessWidget {
  final Widget inputWidget;
  const MaterialMainPage({Key? key, required this.inputWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              this.inputWidget
            ],
          )
        )
      )
    );
  }
}