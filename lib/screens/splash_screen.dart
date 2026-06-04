import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int tiempo = 2;
  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (tiempo==0){
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        setState(() {
          tiempo--;
        });
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/persona.png'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}