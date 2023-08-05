
import 'package:blossom/project/myRoute.dart';
import 'package:blossom/project/providers/mainPageProvider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  const MyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider<MainPageProvider>(
                create: (_) => MainPageProvider()
            )
    ], child: ProjectRoute());
  }
}
