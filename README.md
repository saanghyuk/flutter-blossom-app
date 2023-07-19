# blossom

[Blossom App Structure](https://drive.google.com/file/d/14dIaEYKOCBBXlaQRDj73EDklt6824DYg/view?usp=sharing)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



| Date     | Contents                                     | Commit                                                       |
| -------- | -------------------------------------------- | ------------------------------------------------------------ |
| 20230709 | Project Setup, Splash, Home View, Upload Bar | [Link](https://github.com/saanghyuk/flutter-blossom-app/tree/8c4906e1554ea61a3dd2ab12e585f88f3d94f2f4) |
| 20230712 | Project Structure Setting                    | [Link](https://github.com/saanghyuk/flutter-blossom-app/tree/bb3e53ddc372b69c5f019fd61cdcf4d5b96eefb4) |
|          | MainPage, SafeArea,                          |                                                              |





## Tip

1. 다른 기능 안필요하고 오직 `Stateless`상속을 위한 imports는 `widgets.dart`를 import하면 된다. `cupertino`, `material`둘다 widgets을 품고 있지만 굳이 그 전체를 Import 할 필요가 없다. 

   ```dart
   import 'dart:io';
   import 'package:flutter/widgets.dart';
   
   class ProjectRoute extends StatelessWidget {
     const ProjectRoute({Key? key}) : super(key: key);
   
     @override
     Widget build(BuildContext context) {
       return Container();
     }
   }
   
   ```

   

2. 분기칠 때 실행하고 있는게 앱이라면, `dart:html`을 절대 불러오면 안된다. 

   ```dart
   import 'dart:io';
   import 'package:blossom/project/route/cupertinoRoute.dart';
   import 'package:blossom/project/route/materialRoute.dart';
   import 'package:flutter/widgets.dart';
   
   class ProjectRoute extends StatelessWidget {
     const ProjectRoute({Key? key}) : super(key: key);
   
     @override
     Widget build(BuildContext context) {
      if(Platform.isIOS) return ProjectCupertinoRoute();
      return ProjectMaterialRoute();
     }
   }
   ```

3. iOS, Android 분기치다 보면, 아예 똑같은 이벤트를 Cupertino, Material에서 수행해야 하는 경우가 많다. 그런데, 우리가 나누려는 것은 Lifecycle이 아니고, 오직 `디자인`만을 나누려고 하는 것. 그래서 만들어놓은 것이 `Project/pages/xxxpages/xxxpage.dart`

4. 근데 위처럼 Stateful로 만들어서 다루려다 보니깐, provider 같은 것을 다루기가 귀찮다. 그래서,  각 페이지에 보통 한겹을 더 wrapping한다. 그게 바로 project/components/pages에 들어있는 `xxxxPageComponent.dart` 같은 파일이다. 

