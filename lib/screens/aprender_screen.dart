import 'package:flutter/material.dart';
import 'package:vallenato/widgets/widgets.dart';

class AprenderScreen extends StatelessWidget{
  const AprenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavegacionWidget(pantalla: 'aprender'),
    );
  }
}