import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  final String _baseUrl =
      'identitytoolkit.googleapis.com'; //DOCUMEMTACION DE FIREBASE
  final String _firebaseToken =
      'AIzaSyAdNVSEmV7X5Tef35DslbEYXUOlSe1hIbY'; //API WEB

  //método para crear un usuario
  Future<String?> crearUsuario(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}
