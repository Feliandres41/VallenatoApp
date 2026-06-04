import 'package:flutter/material.dart';
import 'package:vallenato/widgets/repertorio_widget.dart';

class RepertorioScren extends StatelessWidget{
  const RepertorioScren({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Repertorio",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),),
            Text("Explora las categorias",style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 30),
            child: Column(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RepertorioWidget(nombre: 'Paseo', cantCanciones: 12);
                    },));
                  },
                  child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Container(
                      width: size.width*0.9,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1,color: const Color.fromARGB(205, 121, 85, 72)),
                        image: DecorationImage(image: AssetImage('assets/repertorio/primero.png'),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        // colorFilter: ColorFilter.mode(const Color.fromARGB(255, 169, 112, 22),BlendMode.color))
                      ),
                    ),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paseo",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("12 canciones",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  )
                            ),
                ),
              GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RepertorioWidget(nombre: 'merengue', cantCanciones: 8);
                    },));
                  },
                child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Container(
                      width: size.width*0.9,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1,color: const Color.fromARGB(137, 99, 121, 72)),
                        image: DecorationImage(image: AssetImage('assets/repertorio/segundo.png'),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        // colorFilter: ColorFilter.mode(const Color.fromARGB(255, 169, 112, 22),BlendMode.color))
                      ),
                    ),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Merengue",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("8 canciones",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  )),
              ),
                    
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RepertorioWidget(nombre: 'Son', cantCanciones: 5);
                    },));
                  },
                  child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Container(
                      width: size.width*0.9,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1,color: const Color.fromARGB(205, 121, 85, 72)),
                        image: DecorationImage(image: AssetImage('assets/repertorio/tercero.png'),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        // colorFilter: ColorFilter.mode(const Color.fromARGB(255, 169, 112, 22),BlendMode.color))
                      ),
                    ),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Son",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("5 canciones",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  )
                            ),
                ),
                    
              GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RepertorioWidget(nombre: 'Puya', cantCanciones: 0);
                    },));
                  },
                child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Container(
                      width: size.width*0.9,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1,color: const Color.fromARGB(205, 121, 85, 72)),
                        image: DecorationImage(image: AssetImage('assets/repertorio/cuarto.png'),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        // colorFilter: ColorFilter.mode(const Color.fromARGB(255, 169, 112, 22),BlendMode.color))
                      ),
                    ),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Puya",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("0 canciones",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  )
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