import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallenato/providers/provider_web.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/notificacion_widget.dart';
import 'package:vallenato/widgets/widgets.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _passwordChanged = TextEditingController();
  @override
  void dispose(){
    super.dispose();
    _passwordChanged.dispose();
  }
  bool estado = true;
  @override
  Widget build(BuildContext context) {
    final dates = Provider.of<ProviderWeb>(context,listen: false).datosUsuario;
    final size = MediaQuery.of(context).size; // Usamos el tamaño de pantalla para adaptar anchos y altos
    return Scaffold(
      backgroundColor: const Color(0xFF060606),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mi Perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: size.width * 0.28,
                height: size.width * 0.28,
                decoration: BoxDecoration(
                  color: ThemeApp.dorado,
                  borderRadius: BorderRadius.circular(size.width * 0.14),
                  border: Border.all(
                    color: ThemeApp.dorado,
                    width: size.width * 0.02,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: size.width * 0.15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              //problemas de null
              // Text(
              //   dates['username'],
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: size.width * 0.06,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              SizedBox(height: size.height * 0.01),
              //problemas de null
              // Text(
              //   dates['email'],
              //   style: TextStyle(
              //     color: Colors.white70,
              //     fontSize: size.width * 0.04,
              //   ),
              // ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Puntuación Total',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              '9.800',
                              style: TextStyle(
                                color: ThemeApp.dorado,
                                fontSize: size.width * 0.065,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Posición',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.009,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeApp.dorado,
                                borderRadius: BorderRadius.circular(size.width * 0.03),
                              ),
                              child: Text(
                                '#1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estadísticas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _StatItem(label: 'Canciones', value: '24'),
                        _StatItem(label: 'Horas', value: '120'),
                        _StatItem(label: 'Logros', value: '8'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    NotificacionWidget.mostrarMensaje(context, "Sesion cerrada", Colors.red);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.045),
                    ),
                  ),
                  child: Text(
                    'Cerrar Sesión',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              estado==true
              //cambiar contraseña
              ?SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      estado = !estado;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(199, 47, 211, 170),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.045),
                    ),
                  ),
                  child: Text(
                    'Cambiar contraseña',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
              : SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passwordChanged,
                        decoration: InputDecoration(

                          suffix: IconButton(
                            onPressed: () async{
                              if(_passwordChanged.text.isNotEmpty){
                                final respuesta = await Provider.of<ProviderWeb>(context,listen: false).passwordWeb(_passwordChanged.text);
                                if(respuesta["codigo"]==200){
                                  print("200");
                                  if(!_passwordChanged.text.contains(" ")){
                                    NotificacionWidget.mostrarMensaje(context, "Contraseña cambiada con exito", Colors.green);
                                    setState(() {
                                      estado = !estado;
                                    });
                                  }else{
                                    NotificacionWidget.mostrarMensaje(context, "La contraseña no puede contener espacios", Colors.yellow);
                                  }
                                }
                              }else{
                                NotificacionWidget.mostrarMensaje(context, "La contraseña no puede estar vacia", Color.fromARGB(255, 187, 176, 24));
                              }
                            }, icon: Text("Enviar",style: TextStyle(color: Color.fromARGB(199, 47, 211, 170),
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width*0.04),)
                            
                          ),
                          label: Row(
                            children: const [
                              Icon(Icons.password, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Ingrese la nueva contraseña',
                              style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(181, 77, 77, 77),
                              width: 1.4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(181, 77, 77, 77),
                              width: 1.4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavegacionWidget(pantalla: 'perfil'),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: ThemeApp.dorado,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
