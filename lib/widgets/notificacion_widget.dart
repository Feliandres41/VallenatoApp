
import 'package:flutter/material.dart';

class NotificacionWidget {
  static void mostrarMensaje(BuildContext context, String mensaje,Color color) {
  final altura = MediaQuery.of(context).size.height;
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: color,
    padding: EdgeInsets.symmetric(
      vertical: altura*0.005, // reduce la altura
    ),
    content: Text(
      mensaje,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.05,
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 5),
  ),
);
}
}