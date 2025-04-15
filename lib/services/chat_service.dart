import 'package:chat/global/environment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final String token = await AuthService.getToken() ?? 'NoToken';
    final resp = await http
        .get(Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID'), headers: {
      'Content-Type': 'application/json',
      'x-token': token
    });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
