import 'package:chat/global/environment.dart';
import 'package:chat/services/auth_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/material.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  
  IO.Socket get socket => _socket;
  get emit => _socket.emit;

  void connect() async {

    final token = await AuthService.getToken();

    _socket = IO.io(Environment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': token
      }
    });

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
  
  void disconnect() {
    _socket.disconnect();
  }

}