import 'package:flutter/material.dart';

class MaterialProjectPageRoute<T> extends MaterialPageRoute<T>{
  MaterialProjectPageRoute({required super.builder, required super.settings});

  // 어떤거 오버라이드 해야되는지 모르겠으면, 일단 메서드 만들고 this 찍어보기
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    // print("HI");
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
    return SlideTransition(
        position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.bounceInOut)).animate(animation),
        child: child,
    );
  }

}