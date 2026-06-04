import '../screens/screens.dart';
class Rutas {
  static final route = {
    '/':(context)=>SplashScreen(),
    '/home':(context)=>HomeScreen(),
    '/login':(context)=>LoginScreen(),
    '/register':(context)=>RegisterScreen(),
    '/inicio':(context)=>InicioScreen(),
    '/aprender':(context)=>AprenderScreen(),
    '/biografia':(context)=>BiografiaScreen(),
    '/repertorio':(context)=>RepertorioScren(),
    '/evaluacion':(context)=>EvaluacionScreen(),
    '/practicar':(context)=>PracticarScreen(),
    '/ranking':(context)=>RankingScreen(),
    '/perfil':(context)=>PerfilScreen()
  };
}