import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/widgets.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Andres Mora',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'andres@gmail.com',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.04,
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
