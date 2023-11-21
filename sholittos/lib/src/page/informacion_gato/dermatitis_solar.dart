import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DermatitisSolar extends StatelessWidget {
  const DermatitisSolar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pantalla5.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, right: 16.0, left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Dermatitis Solar',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign
                        .center, // Esto centrará el texto horizontalmente
                  ),
                ),
                const SizedBox(height: 20.0),
                _carrusel(),
                const SizedBox(height: 20.0),
                const AudioPlayerWidget(), // Agregamos el reproductor de audio aquí
                const Text(
                  'Patología cutánea provocado por el efecto de la radiación ultravioleta (RUV) de la luz del sol en mi dermis sin pigmento.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Causas:',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign:
                      TextAlign.start, // Esto centrará el texto horizontalmente
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '1. Exposición a los rayos ultravioletas.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '2. Zonas sin pigmento.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '3. Poca cobertura pilosa.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Síntomas:',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign:
                      TextAlign.start, // Esto centrará el texto horizontalmente
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '1. Enrojecimiento en orejas, párpados, nariz, labios, dedos.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '2. Quemaduras solares.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '3. Preneoplásico.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '4. Eritema.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '5. Erosiones.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '6. Ulceraciones.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '7. Costras.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '8. Hemorragia leve.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '9. Prurito.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const Padding(padding: EdgeInsets.all(20))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _carrusel() {
    return CarouselSlider(
      items: ['assets/dermatitissolar.jpeg'].map((imagePath) {
        return Container(
          width: 300,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    player
        .stop(); // Stop the audio player when the widget is removed from the tree
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  if (isPlaying) {
                    player.pause();
                  } else {
                    player.play(AssetSource('DERMATITIS_SOLAR.mp3'));
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 25,
              child: IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  player.stop();
                },
              ),
            ),
          ],
        ),
        Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (value) {
            final position = Duration(seconds: value.toInt());
            player.seek(position);
            player.resume();
          },
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(position.inSeconds)),
              Text(formatTime((duration - position).inSeconds)),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DermatitisSolar(),
  ));
}