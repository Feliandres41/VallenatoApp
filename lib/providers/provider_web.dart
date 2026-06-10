import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderWeb extends ChangeNotifier{
  final String _url = "https://zwhtbuwayehcdpsvwpzf.supabase.co/auth";
  final _apiKey = "sb_publishable_m7zswN4uuc9i3jvTQFXVsw_hMjj13Mp";
  //registro por medio de la web
  Future<Map> registerWeb (String name,String username,String email,String password)async{
    try{
      final url = Uri.parse("$_url/v1/signup");
      final respuesta =  await http.post(
        url,
        headers: {
          "Content-Type":"application/json",
          "apikey": _apiKey,
        },
        body: jsonEncode({
          // "usuario":name,
          "email":email,
          "password":password,
          "data": {
            "name": name,
            "username": "@$username"
            
          }
        })
      );
      if(respuesta.statusCode==200){
        print("Conexion exitosa\n ${respuesta.statusCode}");
        final datosLogin = jsonDecode(respuesta.body);
        token = datosLogin["access_token"];
        datosUsuario = datosLogin["user"]["user_metadata"];
        notifyListeners();
        // return true;
        return ({
          "mensaje":"Cuenta exitoso",
          "estado":201
        });
      }else{
        print(respuesta.statusCode);
        print("error interno");
        notifyListeners();
        return ({
          "mensaje":"Error al crear la cuenta",
          "estado":422
        });
      }
    }catch(e){
      print("error de conexion:\n$e");
      return ({
        "mensaje":"Error de conexion",
        "estado":404
      });
    }
  }
  //login por medio de la web
  String token = "";
  Map datosUsuario = {};
  Future<Map> loginWeb (String email,String password)async{
    try{
      final url = Uri.parse("$_url/v1/token?grant_type=password");
      final respuesta =  await http.post(
        url,
        headers: {
          "Content-Type":"application/json",
          "apikey": _apiKey,
        },
        body: jsonEncode({
          "email":email,
          "password":password,
        })
      );
      if(respuesta.statusCode==200){
        print("Conexion exitosa");
        //datos generales
        final datosLogin = jsonDecode(respuesta.body);
        //token
        token = datosLogin["access_token"];
        
        //datos del usuario para mapearlo
        datosUsuario = datosLogin["user"]["user_metadata"];
        notifyListeners();
        return ({
          "mensaje":"Login exitoso",
          "code":200
        });
      }else{
        print("error interno\n${respuesta.statusCode}");
        notifyListeners();
        return ({
          "mensaje":"Error interno",
          "code":400
        });
      }
    }catch(e){
      print("error de conexion:\n$e");
      return ({
        "mensaje":"Error de conexion",
        "code":404
      });
    }
  }

  //Metodo de cambio de contraseña
  Future<Map> passwordWeb(String password)async{
    try{
      final url = Uri.parse("$_url/v1/user");
      final respuesta = await http.put(
        url,
        headers: {
          "Authorization":"Bearer $token",
          "Content-Type":"application/json",
          "apikey": _apiKey,
        },
        body: jsonEncode({
          "password":password,
        }),
      );
      if(respuesta.statusCode==200){
        print("Contraseña cambiada con exito");
        return ({
          "mensaje":"Contraseña cambiada",
          "codigo":200
        });
      }else{
        print("Error interno");
        return ({
          "mensaje":"error interno",
        });
      }
    }catch(e){
      print("Error de conexion");
      return ({
        "mensaje":"error de conexion",
      });
    }
  }

  //Mandar link de recuperacion de cambio de contraseña
  Future<bool> sendPassword(String email) async{
    final url = Uri.parse("$_url/v1/recover");
    final respuesta = await http.post(
      url,
      headers: {
        "Content-Type":"application/json",
        "apikey": _apiKey,
      },
      body: jsonEncode({
        "email":email,
      }),
    );
    if(respuesta.statusCode == 200){
      print("Verifique su bandeja de entrada");
      return true;
    }else{
      return false;
    }
  }
}
