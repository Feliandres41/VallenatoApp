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
              image: AssetImage('assets/splash.jpeg'),
              fit: BoxFit.contain
            )
          ),
        ),
      ),
    );
  }
}


// cambio de splash //animado
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.asset(
//       'assets/splash.mp4'
//     )..initialize().then((_) {
//       setState(() {});
//       _controller.play();
//       _controller.setLooping(true);
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SizedBox.expand(
//         child: FittedBox(
//           fit: BoxFit.contain,
//           child: Transform.scale(
//             scale: 1.5,
//             child: SizedBox(
//               width: _controller.value.size.width,
//               height: _controller.value.size.height,
//               child: VideoPlayer(_controller),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }