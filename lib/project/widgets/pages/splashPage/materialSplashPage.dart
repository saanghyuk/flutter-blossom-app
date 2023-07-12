import 'package:flutter/material.dart'; 

class MaterialSplashPage extends StatelessWidget {
  final String txt;
  const MaterialSplashPage({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(this.txt))
    );
  }
}
