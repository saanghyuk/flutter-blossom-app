import 'package:flutter/material.dart';

class MaterialProjectPageRoute<T> extends MaterialPageRoute<T>{

  MaterialProjectPageRoute({required super.builder, required super.settings});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
    return SlideTransition(position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.bounceInOut)).animate(animation),
    child: child
    );
  }

}