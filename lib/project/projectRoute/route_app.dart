import 'dart:io';
import 'package:blossom/project/route/cupertinoRoute.dart';
import 'package:blossom/project/route/materialRoute.dart';
import 'package:flutter/widgets.dart';


class ProjectRoute extends StatelessWidget {
  const ProjectRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // @TODO
    if(Platform.isIOS) return ProjectCupertinoRoute();
    return ProjectMaterialRoute();
  }
}

