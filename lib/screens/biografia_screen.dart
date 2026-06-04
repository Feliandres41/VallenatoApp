import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';

class BiografiaScreen extends StatelessWidget{
  const BiografiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final historiaFondo = Color.fromARGB(198, 222, 126, 78);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Biografia',style: TextStyle(
              color: ThemeApp.dorado
            ),),
            Text("Luis Enrique Martínez"),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [

            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              unselectedLabelColor:
                  const Color.fromARGB(151, 255, 255, 255),

              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                
                Tab(text: 'Historia'),
                Tab(text: "Vida artística"),
                Tab(text: "Discografia"),
              ],

              labelColor: ThemeApp.dorado,
              dividerColor: Colors.grey,
              indicatorColor: ThemeApp.dorado,
            ),

            Expanded(
              child: TabBarView(
                children: [
                  //historia
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Column(
                        children: [
                          Container(
                            width: size.width*0.9,
                            height: size.height*0.4,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 88, 59, 5),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage('assets/luis.png'),
                              fit: BoxFit.cover
                              )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: 
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: historiaFondo,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(width: 1,color: const Color.fromARGB(106, 0, 0, 0))
                                  ),child: Icon(Icons.local_fire_department,color: Color.fromARGB(255, 46, 30, 1),size: 43,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("1952",style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      Container(
                                        width: size.width*0.7,
                                        child: Text("Define su estilo único y gana festivales regionales.",style: TextStyle(
                                          fontSize: 13,color: Colors.grey
                                        ),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                    
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: 
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: historiaFondo,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(width: 1,color: const Color.fromARGB(106, 0, 0, 0))
                                  ),child: Icon(Icons.music_note,color: Color.fromARGB(255, 46, 30, 1),size: 43,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("1960's - Consolidación",style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      Container(
                                        width: size.width*0.7,
                                        child: Text("Define su estilo único y gana festivales regionales.",style: TextStyle(
                                          fontSize: 13,color: Colors.grey
                                        ),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                    
                    
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: 
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: historiaFondo,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(width: 1,color: const Color.fromARGB(106, 0, 0, 0))
                                  ),child: Icon(Icons.star,color: Color.fromARGB(255, 46, 30, 1),size: 43,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Premios y Reconocimientos",style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      Container(
                                        width: size.width*0.7,
                                        child: Text("Primer festival de la leyenda vallenata y múltiples trofeos.",style: TextStyle(
                                          fontSize: 13,color: Colors.grey
                                        ),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                    
                    
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: 
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: historiaFondo,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(width: 1,color: const Color.fromARGB(106, 0, 0, 0))
                                  ),child: Icon(Icons.menu_book_outlined,color: Color.fromARGB(255, 46, 30, 1),size: 43,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("1970's - El vallenato Moderno",style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      Container(
                                        width: size.width*0.7,
                                        child: Text("Revoluciona el género con nuevas composiciones y fusiones.",style: TextStyle(
                                          fontSize: 13,color: Colors.grey
                                        ),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),



                          Padding(
                          padding: const EdgeInsets.all(13),
                          child: 
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: historiaFondo,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 1,color: const Color.fromARGB(106, 0, 0, 0))
                                ),child: Icon(Icons.local_fire_department_outlined,color: Color.fromARGB(255, 46, 30, 1),size: 43,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Legado Duradero",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Container(
                                      width: size.width*0.7,
                                      child: Text("Su música es un himno para las nuevas generaciones",style: TextStyle(
                                        fontSize: 13,color: Colors.grey
                                      ),),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                        ],
                      ),
                    ),
                  ),
                  // Center(child: Text("Vida artística")),
                  //VIDA ARTISTICA 
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 29),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: size.width*0.9,
                              height: size.height*0.4,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 88, 59, 5),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage('assets/luisVida.jpg'),
                                fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sus inicios",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Luis Enrique Martínez mostró interés por el acordeón desde muy joven en Valledupar. Aprendió de forma autodidacta, observando a músicos tradicionales del vallenato y practicando por su cuenta hasta dominar el instrumento.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Formación artística",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Su formación no fue académica, sino popular y empírica. Se nutrió del ambiente musical del Caribe colombiano, especialmente del vallenato tradicional, lo que le permitió desarrollar un estilo propio basado en la tradición oral y la práctica constante.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),
                    
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Primeras presentaciones",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Sus primeras presentaciones se dieron en fiestas, parrandas y reuniones locales, donde comenzó a ganar reconocimiento por su habilidad con el acordeón y su estilo innovador dentro del vallenato.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),


                                SizedBox(
                                  height: 10,
                                ),
                                Text("Consolidación artística",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Con el tiempo, se consolidó como uno de los grandes exponentes del vallenato. Su talento lo llevó a grabar discos y a presentarse en escenarios más importantes, ganándose el respeto de músicos y del público.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),


                                SizedBox(
                                  height: 10,
                                ),
                                Text("Estilo e influencia artística",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Su estilo se caracteriza por la rapidez, la creatividad en el acordeón y la fidelidad al vallenato tradicional. Fue considerado un innovador dentro del género, influyendo en nuevas generaciones de acordeoneros.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),


                                SizedBox(
                                  height: 10,
                                ),
                                Text("Obras y aportes importantes",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'Participó en numerosas grabaciones y composiciones que ayudaron a fortalecer el vallenato como género musical representativo de Colombia. Su forma de tocar el acordeón se convirtió en referencia para otros músicos.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),


                                SizedBox(
                                  height: 10,
                                ),
                                Text("Reconocimientos",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700
                                  ),
                                ),
                                Container(
                                  width: size.width*0.91,
                                  child: Text(
                                    'A lo largo de su carrera recibió reconocimiento dentro del folclor vallenato como uno de los grandes maestros del acordeón, siendo admirado por su técnica y aportes al género.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                  )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //DISCOGRAFIA
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Composiciones Emblemáticas",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Composición 1
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 46, 30, 1),
                              border: Border.all(
                                color: ThemeApp.dorado,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ThemeApp.dorado,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.music_note,
                                          color: Color.fromARGB(255, 46, 30, 1),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "La Gota Fría",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: ThemeApp.dorado,
                                              ),
                                            ),
                                            Text(
                                              "Vals Lento",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "1938",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeApp.dorado,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "La composición más icónica de Luis Enrique Martínez. Una obra maestra del vallenato que define el estilo melódico del artista.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Composición 2
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 46, 30, 1),
                              border: Border.all(
                                color: ThemeApp.dorado,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ThemeApp.dorado,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.music_note,
                                          color: Color.fromARGB(255, 46, 30, 1),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Que Vueltas da la Vida",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: ThemeApp.dorado,
                                              ),
                                            ),
                                            Text(
                                              "Paseo",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "1952",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeApp.dorado,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Uno de sus paseos más reconocidos, que demuestra la versatilidad rítmica del maestro.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Composición 3
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 46, 30, 1),
                              border: Border.all(
                                color: ThemeApp.dorado,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ThemeApp.dorado,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.music_note,
                                          color: Color.fromARGB(255, 46, 30, 1),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "La Ceiba",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: ThemeApp.dorado,
                                              ),
                                            ),
                                            Text(
                                              "Merengue Vallenato",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "1948",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeApp.dorado,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Un merengue tradicional que refleja la conexión de Luis Enrique con la naturaleza y la tradición.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Composición 4
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 46, 30, 1),
                              border: Border.all(
                                color: ThemeApp.dorado,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ThemeApp.dorado,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.music_note,
                                          color: Color.fromARGB(255, 46, 30, 1),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "El Príncipe Vallenato",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: ThemeApp.dorado,
                                              ),
                                            ),
                                            Text(
                                              "Vals Lento",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "1955",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeApp.dorado,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Una composición que lo consagra como el príncipe del vallenato, ganador de festivales regionales.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Composición 5
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 46, 30, 1),
                              border: Border.all(
                                color: ThemeApp.dorado,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ThemeApp.dorado,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.music_note,
                                          color: Color.fromARGB(255, 46, 30, 1),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "La Morena",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: ThemeApp.dorado,
                                              ),
                                            ),
                                            Text(
                                              "Paseo",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "1960",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeApp.dorado,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Una de sus composiciones de paseo más románticas y recordadas por su belleza melódica.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}