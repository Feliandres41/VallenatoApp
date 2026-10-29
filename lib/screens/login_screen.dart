import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: size.width * 0.085,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  'La aplicación está en modo de prueba sin conexión.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  width: size.width * 0.38,
                  height: size.width * 0.38,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: ThemeApp.dorado),
                    borderRadius: BorderRadius.circular(size.width * 0.19),
                    color: const Color.fromARGB(255, 30, 20, 0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/acordeon.jpg', fit: BoxFit.cover),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  'Entrarás con el perfil de Juan Pablo Medina, instructor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/inicio');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeApp.dorado,
                      foregroundColor: const Color.fromARGB(255, 8, 5, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Continuar sin conexión',
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
