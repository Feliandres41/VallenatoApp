import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderWeb extends ChangeNotifier {
  ProviderWeb() {
    sendPassword("");
    listImagesHombres();
    listImagesMujeres();
    buscarImagen("");
  }
  //id del usuario
  String idUser = "";
  //url general
  final String _url = "https://zwhtbuwayehcdpsvwpzf.supabase.co/auth";
  //url imagen
  final String _urlImage = "https://zwhtbuwayehcdpsvwpzf.supabase.co/storage";
  final _apiKey = "sb_publishable_m7zswN4uuc9i3jvTQFXVsw_hMjj13Mp";
  //registro por medio de la web
  Future<Map> registerWeb(
    String name,
    String username,
    String email,
    String password,
  ) async {
    try {
      final url = Uri.parse("$_url/v1/signup");
      final respuesta = await http.post(
        url,
        headers: {"Content-Type": "application/json", "apikey": _apiKey},
        body: jsonEncode({
          // "usuario":name,
          "email": email,
          "password": password,
          "data": {"name": name, "username": "@$username"},
        }),
      );
      if (respuesta.statusCode == 200) {
        print("Conexion exitosa\n ${respuesta.statusCode}");
        final datosLogin = jsonDecode(respuesta.body);
        token = datosLogin["access_token"];
        datosUsuario = datosLogin["user"]["user_metadata"];
        idUser = datosLogin["user"]["id"];
        await obtenerPerfil();
        notifyListeners();
        // return true;
        return ({"mensaje": "Cuenta exitoso", "estado": 201});
      } else {
        print(respuesta.statusCode);
        print("error interno");
        notifyListeners();
        return ({"mensaje": "Error al crear la cuenta", "estado": 422});
      }
    } catch (e) {
      print("error de conexion:\n$e");
      return ({"mensaje": "Error de conexion", "estado": 404});
    }
  }

  //login por medio de la web
  String token = "";
  Map datosUsuario = {};
  Future<Map> loginWeb(String email, String password) async {
    try {
      final url = Uri.parse("$_url/v1/token?grant_type=password");
      final respuesta = await http.post(
        url,
        headers: {"Content-Type": "application/json", "apikey": _apiKey},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (respuesta.statusCode == 200) {
        print("Conexion exitosa");
        //datos generales
        final datosLogin = jsonDecode(respuesta.body);
        //token
        token = datosLogin["access_token"];
        idUser = datosLogin["user"]["id"];

        //datos del usuario para mapearlo
        datosUsuario = datosLogin["user"]["user_metadata"];
        await obtenerPerfil();
        notifyListeners();
        return ({"mensaje": "Login exitoso", "code": 200});
      } else {
        print("error interno\n${respuesta.statusCode}");
        notifyListeners();
        return ({"mensaje": "Error interno", "code": 400});
      }
    } catch (e) {
      print("error de conexion:\n$e");
      return ({"mensaje": "Error de conexion", "code": 404});
    }
  }

  //Metodo de cambio de contraseña
  Future<Map> passwordWeb(String password) async {
    try {
      final url = Uri.parse("$_url/v1/user");
      final respuesta = await http.put(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "apikey": _apiKey,
        },
        body: jsonEncode({"password": password}),
      );
      if (respuesta.statusCode == 200) {
        print("Contraseña cambiada con exito");
        return ({"mensaje": "Contraseña cambiada", "codigo": 200});
      } else {
        print("Error interno");
        return ({"mensaje": "error interno"});
      }
    } catch (e) {
      print("Error de conexion");
      return ({"mensaje": "error de conexion"});
    }
  }

  //Mandar link de recuperacion de cambio de contraseña
  Future<bool> sendPassword(String email) async {
    final url = Uri.parse("$_url/v1/recover");
    final respuesta = await http.post(
      url,
      headers: {"Content-Type": "application/json", "apikey": _apiKey},
      body: jsonEncode({"email": email}),
    );
    if (respuesta.statusCode == 200) {
      print("Verifique su bandeja de entrada");
      return true;
    } else {
      return false;
    }
  }

  //mapa de hombres
  List listaHombres = [];
  Future<Map> listImagesHombres() async {
    try {
      final url = Uri.parse("$_urlImage/v1/object/list/imagenes");
      final respuesta = await http.post(
        url,
        headers: {"Content-Type": "application/json", "apikey": _apiKey},
        body: jsonEncode({"prefix": "hombre/", "limit": 100, "offset": 0}),
      );
      if (respuesta.statusCode == 200) {
        final datos = jsonDecode(respuesta.body);
        listaHombres = datos;
        notifyListeners();
        return ({"mensaje": "todo correcto"});
      } else {
        return ({"mensaje": "error interno"});
      }
    } catch (e) {
      return ({"mensaje": "error de conexion"});
    }
  }

  //mapa de mujeres
  List listaMujeres = [];
  Future<Map> listImagesMujeres() async {
    try {
      final url = Uri.parse("$_urlImage/v1/object/list/imagenes");
      final respuesta = await http.post(
        url,
        headers: {"Content-Type": "application/json", "apikey": _apiKey},
        body: jsonEncode({"prefix": "mujer/", "limit": 100, "offset": 0}),
      );
      if (respuesta.statusCode == 200) {
        final datos = jsonDecode(respuesta.body);
        listaMujeres = datos;
        notifyListeners();
        return ({"mensaje": "todo correcto"});
      } else {
        return ({"mensaje": "error interno"});
      }
    } catch (e) {
      return ({"mensaje": "error de conexion"});
    }
  }

  //ver imagen(individualmente)
  String verImagen = "";
  Future<bool> buscarImagen(String nombre) async {
    final url = Uri.parse(
      "$_urlImage/v1/object/public/imagenes/hombre/$nombre",
    );
    final respuesta = await http.get(
      url,
      headers: {"Content-Type": "application/json", "apikey": _apiKey},
    );
    if (respuesta.statusCode == 200) {
      print(url.toString());
      verImagen = url.toString();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  //guardar avatar en el perfil(base de datos)
  Future<bool> guardarImagenPerfil(String imagePath) async {
    try {
      final url = Uri.parse(
        "https://zwhtbuwayehcdpsvwpzf.supabase.co/rest/v1/perfil",
      );

      final respuesta = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "apikey": _apiKey,
          "Authorization": "Bearer $token",
          "Prefer": "return=representation",
        },
        body: jsonEncode({"user_id": idUser, "image_path": imagePath}),
      );

      if (respuesta.statusCode == 201) {
        print("Imagen guardada correctamente");
        // Actualizar el estado local para evitar datos desincronizados
        avatarPerfil = imagePath;
        // Intentar obtener la URL pública de la imagen y notificar
        await perfilId(avatarPerfil);
        notifyListeners();
        return true;
      } else {
        print(respuesta.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  //PERFIL-AVATAR
  //ver imagen(individualmente)
  String perfil = "";
  Future<bool> perfilId(String nombre) async {
    final url = Uri.parse(
      "$_urlImage/v1/object/public/imagenes/avatar/$nombre",
    );
    final respuesta = await http.get(
      url,
      headers: {"Content-Type": "application/json", "apikey": _apiKey},
    );
    if (respuesta.statusCode == 200) {
      print(url.toString());
      perfil = url.toString();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  //imagen del perfil
  String avatarPerfil = "";
  Future<bool> obtenerPerfil() async {
    try {
      final url = Uri.parse(
        "https://zwhtbuwayehcdpsvwpzf.supabase.co/rest/v1/perfil?user_id=eq.$idUser&select=image_path",
      );

      final respuesta = await http.get(
        url,
        headers: {"Content-Type": "application/json", "apikey": _apiKey},
      );

      if (respuesta.statusCode == 200) {
        final data = jsonDecode(respuesta.body);

        if (data.isNotEmpty) {
          avatarPerfil = data[0]["image_path"];
          print("___________________\n$avatarPerfil");
          await perfilId(avatarPerfil);
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        print(respuesta.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
