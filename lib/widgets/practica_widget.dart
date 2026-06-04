import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vallenato/themes/theme_app.dart';

class PracticaWidget extends StatefulWidget {
  PracticaWidget({super.key});

  @override
  State<PracticaWidget> createState() => _PracticaWidgetState();
}

class _PracticaWidgetState extends State<PracticaWidget> {
  late VideoPlayerController _referenceController;

  @override
  void initState() {
    super.initState();
    _referenceController = VideoPlayerController.asset('assets/video.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _referenceController.play();
      });
  }

  void _stopReferencePlayback() {
    if (_referenceController.value.isInitialized) {
      _referenceController.pause();
      _referenceController.seekTo(Duration.zero);
    }
  }

  @override
  void deactivate() {
    _stopReferencePlayback();
    super.deactivate();
  }

  @override
  void dispose() {
    _referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _stopReferencePlayback();
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Grabación',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'La Gota Fria',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28),
                _ReferenceCard(controller: _referenceController),
                SizedBox(height: 18),
                _RecordingCard(title: 'Tu interpretación'),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ControlButton(
                      icon: Icons.refresh,
                      label: 'Reintentar',
                      color: Colors.white,
                      background: Colors.white12,
                      onTap: () {},
                    ),
                    _StopButton(onTap: null),
                    _ControlButton(
                      icon: Icons.skip_next_rounded,
                      label: 'Enviar',
                      color: Colors.white,
                      background: Colors.white12,
                      onTap: () {
                        _stopReferencePlayback();
                        Navigator.of(context).pushNamed('/evaluacion');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  _RecordCard({
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: double.infinity,
            height: 176,
            color: Colors.white12,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.white12,
                child: Center(
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white38,
                    size: 56,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReferenceCard extends StatelessWidget {
  const _ReferenceCard({
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Referencia',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: double.infinity,
            height: 400,
            color: Colors.black,

            child: controller.value.isInitialized
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller),
                        ),
                      ),

                      // OVERLAY OSCURO
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black26,
                              Colors.black26,
                            ],
                          ),
                        ),
                      ),

                      // ICONO PLAY
                      Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white70,
                          size: 48,
                        ),
                      ),
                    ],
                  )

                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.white70,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
class _RecordingCard extends StatelessWidget {
  _RecordingCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 176,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white24, width: 1.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mic_none,
                color: Colors.white54,
                size: 48,
              ),
              SizedBox(height: 12),
              Text(
                'Presiona para grabar tu interpretación',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  _ControlButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
    required this.background,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white12, width: 1),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StopButton extends StatelessWidget {
  _StopButton({required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 82,
        height: 82,
        decoration: BoxDecoration(
          color: ThemeApp.dorado,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ThemeApp.dorado.withOpacity(0.35),
              blurRadius: 18,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 34,
          ),
        ),
      ),
    );
  }
}
