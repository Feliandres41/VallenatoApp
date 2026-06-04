import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';
import '../widgets/widgets.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String nombre = "Andres";
    final size = MediaQuery.of(context).size; // Calcula el ancho y alto actuales
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.06,
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  child: Row(
                    children: [
                      Text('Hola, ', style: TextStyle(fontSize: size.width * 0.05)),
                      Text(
                        '$nombre',
                        style: TextStyle(
                          fontSize: size.width * 0.055,
                          color: ThemeApp.dorado,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.025),
                    ),
                    width: size.width * 0.9,
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.01,
                              left: size.width * 0.02,
                              bottom: size.height * 0.01,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tu progreso actual",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.045,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.65,
                                      height: size.height * 0.02,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(size.width * 0.025),
                                        color: const Color.fromARGB(
                                          66,
                                          158,
                                          158,
                                          158,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: size.width * 0.002),
                                      child: Text(
                                        '0%',
                                        style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.025),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 189, 146, 67),
                          Color.fromARGB(255, 129, 96, 34),
                        ],
                      ),
                    ),
                    width: size.width * 0.9,
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.025),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Continuar aprendiendo",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 0.22,
                                    height: size.width * 0.22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(size.width * 0.075),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/portada.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "La gota fría",
                                        style: TextStyle(
                                          fontSize: size.width * 0.048,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.015),
                                      Text(
                                        "Primera sesión",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: const Color.fromARGB(
                                            169,
                                            255,
                                            255,
                                            255,
                                          ),
                                          fontSize: size.width * 0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: size.width * 0.03),
                                  Container(
                                    width: size.width * 0.12,
                                    height: size.width * 0.12,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        211,
                                        176,
                                        112,
                                      ),
                                      borderRadius: BorderRadius.circular(size.width),
                                      border: Border.all(
                                        width: size.width * 0.003,
                                        color: const Color.fromARGB(
                                          255,
                                          192,
                                          139,
                                          39,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: size.width * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explorar",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: size.width * 0.055,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ExplorarButton(
                            label: 'Repertorio',
                            icon: Icons.music_note_sharp,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(31, 175, 27, 163),
                                Color.fromARGB(255, 32, 22, 126),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/repertorio');
                            },
                            size: size,
                          ),
                          _ExplorarButton(
                            label: 'Biografía',
                            icon: Icons.menu_book,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(197, 175, 98, 27),
                                Color.fromARGB(255, 148, 62, 22),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/biografia');
                            },
                            size: size,
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ExplorarButton(
                            label: 'Practicar',
                            icon: Icons.menu_book_sharp,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(31, 12, 122, 45),
                                Color.fromARGB(255, 22, 102, 126),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/repertorio');
                            },
                            size: size,
                          ),
                          _ExplorarButton(
                            label: 'Ranking',
                            icon: Icons.emoji_events,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(197, 165, 175, 27),
                                Color.fromARGB(255, 148, 129, 22),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/ranking');
                            },
                            size: size,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Acerca de la apk",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: size.width * 0.055,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        width: size.width * 0.88,
                        child: Text(
                          "Es una aplicación diseñada para enseñar a tocar acordeón de forma práctica y entretenida. Incluye lecciones para aprender desde lo básico, música para escuchar y practicar, un sistema de ranking que motiva a los usuarios a mejorar continuamente y una sección especial con la biografía de Luis Enrique Martínez, una de las grandes leyendas del vallenato. Ideal para quienes quieren aprender, practicar y conectarse con la cultura del acordeón.",
                          style: TextStyle(fontSize: size.width * 0.038),
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavegacionWidget(pantalla: "inicio"),
    );
  }
}

class _ExplorarButton extends StatelessWidget {
  const _ExplorarButton({
    required this.label,
    required this.icon,
    required this.gradient,
    required this.onTap,
    required this.size,
  });

  final String label;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(size.width * 0.03),
          border: Border.all(width: 1, color: Colors.white24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.1,
              height: size.width * 0.1,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(size.width * 0.06),
              ),
              child: Icon(icon, size: size.width * 0.06),
            ),
            SizedBox(width: size.width * 0.03),
            Text(
              label,
              style: TextStyle(fontSize: size.width * 0.038),
            ),
          ],
        ),
      ),
    );
  }
}

