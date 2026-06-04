import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderWeb extends ChangeNotifier{
  final String _url = "https://zwhtbuwayehcdpsvwpzf.supabase.co/auth";
  final _apiKey = "sb_publishable_m7zswN4uuc9i3jvTQFXVsw_hMjj13Mp";
  //registro por medio de la web
  Future<bool> registerWeb (String name,String email,String password)async{
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
            "username": name,
            "nombre": name
          }
        })
      );
      if(respuesta.statusCode==200 || respuesta.statusCode==201){
        print("Conexion exitosa");
        notifyListeners();
        return true;
      }else{
        print("error interno");
        notifyListeners();
        return false;
      }
    }catch(e){
      print("error de conexion:\n$e");
      return false;
    }
  }
  //login por medio de la web
  Map datosLogin={};
  String token = "";
  Future<bool> loginWeb (String email,String password)async{
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
        datosLogin = jsonDecode(respuesta.body);
        token = datosLogin["access_token"];
        notifyListeners();
        return true;
      }else{
        print("error interno");
        notifyListeners();
        return false;
      }
    }catch(e){
      print("error de conexion:\n$e");
      return false;
    }
  }

  //Metodo de cambio de contraseña
  Future<bool> passwordWeb(String password)async{
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
      return true;
    }else{
      print("Error");
      return false;
    }
  }
}
