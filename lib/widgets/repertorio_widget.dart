import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/info_music_repertorio_widget.dart';

class RepertorioWidget extends StatelessWidget {
  RepertorioWidget({
    super.key,
    required this.nombre,
    required this.cantCanciones,
  });

  final String nombre;
  final int cantCanciones;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(nombre),
      ),
      body: cantCanciones > 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Cantidad de canciones: $cantCanciones",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cantCanciones,
                    itemBuilder: (context, index) {

                      final String calificacion =
                          index % 2 == 0 ? 'Facil' : 'Dificil';

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {

                            print(calificacion);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InfoMusicRepertorioWidget(
                                  nombre:
                                      'La gota fria (${index + 1})',
                                  dificultad: calificacion,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: SizedBox(
                              width: size.width * 0.9,
                              height: size.height * 0.15,
                              child: Row(
                                children: [

                                  Image.asset(
                                    'assets/musicas.jpg',
                                    width: 100,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          'La gota fria (${index + 1})',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w500,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "Luis E. Martínez",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight:
                                                FontWeight.w300,
                                          ),
                                        ),

                                        SizedBox(height: 8),

                                        index % 2 == 0
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                  Icon(
                                                    Icons.star_half_rounded,
                                                    color:
                                                        ThemeApp.dorado,
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),

                                  Spacer(),

                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.chevron_right_sharp,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                "No se encontro ninguna canción",
              ),
            ),
    );
  }
}