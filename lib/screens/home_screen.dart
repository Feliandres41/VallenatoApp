import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tomamos el tamaño actual de pantalla

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/inicio.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08, // Margen superior proporcional
            ),
            Column(
              children: [
                Text(
                  'Toca',
                  style: TextStyle(
                    color: Color.fromARGB(255, 222, 171, 78),
                    fontSize: size.width * 0.095, // Texto escalable según el ancho
                    fontWeight: FontWeight.w800,
                    fontFamily: 'PlaywriteGBJ',
                  ),
                ),
                Text(
                  'Vallenato',
                  style: TextStyle(
                    color: Color.fromARGB(255, 222, 171, 78),
                    fontSize: size.width * 0.095,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'PlaywriteGBJ',
                  ),
                ),
              ],
            ),
            Spacer(), // Empuja el contenido inferior hacia el final sin usar altura fija
            Column(
              children: [
                Text(
                  "Aprende el legado de",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "Luis Enríque Martínez",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.015),
            Container(
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ButtonStyle().copyWith(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 141, 107, 43),
                  ),
                  shape: WidgetStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Text(
                  'Comenzar',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: Color.fromARGB(255, 8, 5, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }
} 