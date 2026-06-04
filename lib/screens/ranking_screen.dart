import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/navegacion_widget.dart';
import 'package:vallenato/widgets/ranking_widget.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060606),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Ranking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'La Gota Fría',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PodiumUser(
                          position: '2',
                          name: 'Carlos',
                          score: '9.100',
                          color: const Color.fromARGB(60, 11, 82, 7),
                          isCrowned: false,
                          height: 130,
                        ),
                        PodiumUser(
                          position: '1',
                          name: 'Andres',
                          score: '9.800',
                          color: ThemeApp.dorado,
                          isCrowned: true,
                          height: 170,
                        ),
                        const PodiumUser(
                          position: '3',
                          name: 'Maria',
                          score: '8.500',
                          color: Colors.orangeAccent,
                          isCrowned: false,
                          height: 120,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Los mejores int�rpretes de hoy',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const RankingRow(position: 4, name: 'Juan Camilo', score: '8.100'),
              const SizedBox(height: 12),
              const RankingRow(position: 5, name: 'Valentina', score: '7.900'),
              const SizedBox(height: 12),
              const RankingRow(position: 6, name: 'Pedro', score: '7.600'),
              const SizedBox(height: 12),
              const RankingRow(position: 7, name: 'Santiago', score: '7.200'),
              const SizedBox(height: 22),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeApp.dorado,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Ver más',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavegacionWidget(pantalla: 'ranking'),
    );
  }
}
