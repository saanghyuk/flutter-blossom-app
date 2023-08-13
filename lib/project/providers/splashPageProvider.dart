import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageProvider with ChangeNotifier{

  Future<void> loginCheck({
    required FutureOr<void> Function() onDone,
    required FutureOr<void> Function() onErr,
  }) async {
    final _pref = await SharedPreferences.getInstance();
    bool _loginCheck = _pref.getBool("loginCheck") ?? false;
    if(_loginCheck){
      await onDone();
    }
    else {
      await onErr();
    }

  }
}