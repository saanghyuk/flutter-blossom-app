import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketIoProvider with ChangeNotifier{
  SocketIoProvider(){
    this._init();
  }
  void _init(){
    IO.Socket socket = IO.io(
        "ws://192.168.45.171:3001",
        IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
    )
    // 연결 됬을 때 호출될 이벤트
      ..onConnect((_) {
        print('connect');
      })
      ..on("data", (data){
        print(data);
      })
    // 연결 할 것
      ..connect();

    // 수신 on 송신 emit
    // 페이지 이동하거나 그럴때는 꺼줘야 한다. 필요할때 열고 필요할때 꺼야한다.
    // socket.close();
  }
}