import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';

class NavegacionWidget extends StatefulWidget{
  NavegacionWidget({
    super.key,
    required this.pantalla,
  });
  String pantalla;

  @override
  State<NavegacionWidget> createState() => _NavegacionWidgetState();
}

class _NavegacionWidgetState extends State<NavegacionWidget> {
  final dorado = ThemeApp.dorado;
  //inicio
  var inicio = Colors.white;
  //practicar
  var practicar = Colors.white;
  //ranking
  var ranking = Colors.white;
  //perfil
  var perfil = Colors.white;

  String get pantalla => widget.pantalla;

  @override
  void initState(){
    super.initState();
    if(pantalla=="inicio"){
      inicio=dorado;
    }else if(pantalla=="practicar"){
      practicar = dorado;
    }else if(pantalla=="ranking"){
      ranking=dorado;
    }else if(pantalla=="perfil"){
      perfil=dorado;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 70,
        children: [
          GestureDetector(
            onTap: () {
              if(pantalla=="inicio"){
                null;
              }else{
                Navigator.pushReplacementNamed(context, '/inicio');
              }
            },
            child: Column(
              children: [
                Icon(Icons.home,color: inicio,),
                Text('Inicio',style: TextStyle(
                  color: inicio
                ),)
              ],
            ),
          ),
          
          
          //ranking
          GestureDetector(
            onTap: () {
              if(pantalla=="ranking"){
                null;
              }else{
                Navigator.pushReplacementNamed(context, '/ranking');
              }
            },
            child: Column(
              children: [
                Icon(Icons.emoji_events,color: ranking,),
                Text('Ranking',style: TextStyle(
                  color: ranking
                ),)
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if(pantalla=="perfil"){
                null;
              }else{
                Navigator.pushReplacementNamed(context, '/perfil');
              }
            },
            child: Column(
              children: [
                Icon(Icons.person,color: perfil,),
                Text('Perfil',style: TextStyle(
                  color: perfil
                ),)
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}