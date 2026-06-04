import 'package:flutter/material.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/practica_widget.dart';

class InfoMusicRepertorioWidget extends StatefulWidget {
  InfoMusicRepertorioWidget({
    super.key,
    required this.nombre,
    required this.dificultad,
  });

  final String nombre;
  final String dificultad;

  static final List<Map<String, dynamic>> _sections = [
    {
      'label': 'INTRO',
      'lines': [
        {'chords': 'La        Re        Mi7       La', 'lyrics': null},
      ]
    },
    {
      'label': 'VERSO 1',
      'lines': [
        {'chords': 'La                    Re', 'lyrics': 'Me contaron que en tu pago'},
        {'chords': 'Mi7                   La', 'lyrics': 'andas mal hablando de mí'},
        {'chords': 'La                    Re', 'lyrics': 'no me importa lo que digas'},
        {'chords': 'Mi7                   La', 'lyrics': 'yo sé que mientes por ahí'},
      ]
    },
    {
      'label': 'CORO',
      'lines': [
        {'chords': 'Re           La', 'lyrics': 'Y la gota fría'},
        {'chords': 'Mi7          La', 'lyrics': 'que me da es por tí'},
        {'chords': 'Re           La', 'lyrics': 'y la gota fría'},
        {'chords': 'Mi7          La', 'lyrics': 'que me da es por tí'},
      ]
    },
    {
      'label': 'PUENTE ACORDEÓN',
      'lines': [
        {'chords': 'La  —  Re  —  Mi7  —  La', 'lyrics': null},
        {'chords': 'La  —  Re  —  Mi7  —  La', 'lyrics': null},
      ]
    },
  ];

  @override
  State<InfoMusicRepertorioWidget> createState() => _InfoMusicRepertorioWidgetState();
}

class _InfoMusicRepertorioWidgetState extends State<InfoMusicRepertorioWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5, color: ThemeApp.dorado),
                      image: DecorationImage(
                        image: AssetImage('assets/musicas.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.nombre,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        "Luis Enrique Martínez",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dificultad",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)),
                      SizedBox(height: 6),
                      Text("Duración",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.dificultad,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: widget.dificultad == "Dificil"
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          SizedBox(width: 30),
                          _buildStars(widget.dificultad),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3:45",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => PracticaWidget(),));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: ThemeApp.dorado,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text('Practicar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(height: 1, thickness: 0.5),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: ThemeApp.dorado,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ThemeApp.dorado,
                  tabs: [
                    Tab(text: 'Acordes'),
                    Tab(text: 'Info'),
                  ],
                ),
                SizedBox(
                  height: 520,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: InfoMusicRepertorioWidget._sections.map((section) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14, bottom: 6),
                                  child: Text(
                                    section['label'] as String,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                ...(section['lines'] as List<Map<String, dynamic>>)
                                    .map((line) => _ChordLine(
                                          chords: line['chords'] as String,
                                          lyrics: line['lyrics'] as String?,
                                        ))
                                    .toList(),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: _MetricCard(label: 'BPM', value: '148', sub: 'Allegro', highlight: true)),
                                SizedBox(width: 10),
                                Expanded(child: _MetricCard(label: 'Compás', value: '2/4', sub: 'Paseo vallenato')),
                              ],
                            ),
                            SizedBox(height: 20),
                            _SectionLabel(text: 'Datos de la canción'),
                            SizedBox(height: 8),
                            _InfoCard(rows: [
                              _InfoRow(icon: Icons.calendar_today_outlined, label: 'Año',        value: '1993'),
                              _InfoRow(icon: Icons.album_outlined,          label: 'Álbum',      value: '40 Grandes Éxitos'),
                              _InfoRow(icon: Icons.edit_outlined,           label: 'Compositor', value: 'Carlos Vives'),
                              _InfoRow(icon: Icons.music_note_outlined,     label: 'Género',     value: 'Paseo vallenato'),
                              _InfoRow(icon: Icons.piano_outlined,          label: 'Tonalidad',  value: 'La mayor', highlight: true),
                            ]),
                            SizedBox(height: 20),
                            _SectionLabel(text: 'Técnica'),
                            SizedBox(height: 8),
                            _InfoCard(rows: [
                              _InfoRow(icon: Icons.queue_music_outlined,  label: 'Instrumento',        value: 'Acordeón diatónico'),
                              _InfoRow(icon: Icons.format_list_numbered,  label: 'Hilera recomendada', value: '1ª hilera', highlight: true),
                              _InfoRow(icon: Icons.speed_outlined,        label: 'Dificultad',         value: 'Difícil', danger: true),
                            ]),
                            SizedBox(height: 20),
                            _SectionLabel(text: 'Artista'),
                            SizedBox(height: 8),
                            _ArtistCard(),
                            SizedBox(height: 20),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStars(String dificultad) {
    final bool isDificil = dificultad == "Dificil";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: ThemeApp.dorado, size: 20),
        Icon(Icons.star, color: ThemeApp.dorado, size: 20),
        Icon(Icons.star, color: ThemeApp.dorado, size: 20),
        Icon(Icons.star, color: ThemeApp.dorado, size: 20),
        Icon(isDificil ? Icons.star_half : Icons.star,
            color: ThemeApp.dorado, size: 20),
      ],
    );
  }
}

// ── Subwidgets de Info ─────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  _SectionLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        color: Colors.grey,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  _MetricCard({
    required this.label,
    required this.value,
    required this.sub,
    this.highlight = false,
  });
  final String label;
  final String value;
  final String sub;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 11, color: Colors.grey, letterSpacing: 1)),
          SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: highlight ? ThemeApp.dorado : Colors.white,
              )),
          SizedBox(height: 2),
          Text(sub,
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _InfoRow {
  _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.highlight = false,
    this.danger = false,
  });
  final IconData icon;
  final String label;
  final String value;
  final bool highlight;
  final bool danger;
}

class _InfoCard extends StatelessWidget {
  _InfoCard({required this.rows});
  final List<_InfoRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: Colors.white12),
      ),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          final i = entry.key;
          final row = entry.value;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 13),
                child: Row(
                  children: [
                    Icon(row.icon, size: 18, color: Colors.grey),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(row.label,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ),
                    Text(
                      row.value,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: row.danger
                            ? Colors.redAccent
                            : row.highlight
                                ? ThemeApp.dorado
                                : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (i < rows.length - 1)
                Divider(height: 1, thickness: 0.5, indent: 46),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _ArtistCard extends StatelessWidget {
  _ArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: ThemeApp.dorado.withOpacity(0.15),
                child: Icon(Icons.person_outline,
                    color: ThemeApp.dorado, size: 24),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Luis Enrique Martínez",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                  SizedBox(height: 2),
                  Text("El Pollo Vallenato",
                      style: TextStyle(
                          fontSize: 12, color: ThemeApp.dorado)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Acordeonero y compositor nacido en Fundación, Magdalena. "
            "Uno de los referentes más importantes del vallenato tradicional, "
            "ganador múltiples veces del Festival de la Leyenda Vallenata.",
            style: TextStyle(
                fontSize: 13, color: Colors.grey, height: 1.6),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Chip(label: 'Valledupar', highlight: true),
              _Chip(label: 'Fundación, Magdalena'),
              _Chip(label: 'Festival Vallenato'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  _Chip({required this.label, this.highlight = false});
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: highlight
            ? ThemeApp.dorado.withOpacity(0.12)
            : Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.5,
          color: highlight ? ThemeApp.dorado.withOpacity(0.4) : Colors.white12,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: highlight ? ThemeApp.dorado : Colors.grey,
        ),
      ),
    );
  }
}


class _ChordLine extends StatelessWidget {
  _ChordLine({required this.chords, this.lyrics});
  final String chords;
  final String? lyrics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chords,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              color: ThemeApp.dorado,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              height: 1.6,
            ),
          ),
          if (lyrics != null)
            Text(
              lyrics!,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
        ],
      ),
    );
  }
}