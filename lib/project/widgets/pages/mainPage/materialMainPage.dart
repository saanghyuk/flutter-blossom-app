import 'package:flutter/material.dart'; 

// Page 배치, pages에 들어있는 애들은 레이아웃 가지고 와서 배치만 하는 것.
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
                this.inputWidget,
            ],
          ),
        )
      )
    );
  }
}
