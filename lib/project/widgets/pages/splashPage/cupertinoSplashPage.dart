import 'package:flutter/cupertino.dart'; 

class CupertinoSplashPage  extends StatelessWidget {
  final String txt;
  const CupertinoSplashPage ({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(child: Text(this.txt))
    );
  }
}
