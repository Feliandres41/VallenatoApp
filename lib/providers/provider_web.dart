import 'package:flutter/material.dart';

class ProviderWeb extends ChangeNotifier {
  ProviderWeb();

  String idUser = 'demo-user';
  String token = 'offline-demo';
  Map datosUsuario = {
    'name': 'Juan Pablo Medina',
    'username': 'Juan Pablo Medina',
    'email': 'juanpablo.medina@vallenato.demo',
    'role': 'Instructor',
  };

  List listaHombres = [
    {'name': 'hombre_1.png'},
    {'name': 'hombre_2.png'},
    {'name': 'hombre_3.png'},
  ];
  List listaMujeres = [
    {'name': 'mujer_1.png'},
    {'name': 'mujer_2.png'},
    {'name': 'mujer_3.png'},
  ];

  String verImagen = '';
  String perfil = 'assets/avatars/hombre/hombre_1.png';
  String avatarPerfil = 'hombre_1.png';

  Future<Map> registerWeb(
    String name,
    String username,
    String email,
    String password,
  ) async {
    datosUsuario = {
      'name': name,
      'username': '@$username',
      'email': email,
      'role': 'Estudiante',
    };
    notifyListeners();
    return {'mensaje': 'Cuenta de prueba creada', 'estado': 201};
  }

  Future<Map> loginWeb(String email, String password) async {
    notifyListeners();
    return {'mensaje': 'Sesión de prueba iniciada', 'code': 200};
  }

  Future<Map> passwordWeb(String password) async {
    return {'mensaje': 'Contraseña de prueba actualizada', 'codigo': 200};
  }

  Future<bool> sendPassword(String email) async => false;

  Future<Map> listImagesHombres() async => {'mensaje': 'todo correcto'};

  Future<Map> listImagesMujeres() async => {'mensaje': 'todo correcto'};

  Future<bool> buscarImagen(String nombre) async {
    verImagen = 'assets/avatars/hombre/$nombre';
    return true;
  }

  Future<bool> guardarImagenPerfil(String imagePath) async {
    avatarPerfil = imagePath;
    perfil = 'assets/avatars/${imagePath.startsWith('hombre_') ? 'hombre' : 'mujer'}/$imagePath';
    notifyListeners();
    return true;
  }

  Future<bool> perfilId(String nombre) async {
    avatarPerfil = nombre;
    perfil =
        'assets/avatars/${nombre.startsWith('hombre_') ? 'hombre' : 'mujer'}/$nombre';
    notifyListeners();
    return true;
  }

  Future<bool> obtenerPerfil() async => true;
}
