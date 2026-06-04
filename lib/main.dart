import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallenato/providers/provider_web.dart';
import './routes/rutas.dart';
import './themes/theme_app.dart';

void main(){
  runApp(ConsumerApiWeb());
}

class ConsumerApiWeb extends StatelessWidget{
  const ConsumerApiWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ProviderWeb())
    ],child: Myapp(),);
  }
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Rutas.route,
      theme: ThemeApp.tema,
    );
  }
}