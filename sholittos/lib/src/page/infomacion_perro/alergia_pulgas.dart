import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DermatitisPulgas extends StatelessWidget {
  const DermatitisPulgas({Key? key}) : super(key: key);

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
                    'Dermatitis por alergia a picadura de pulgas',
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
                  'La alergia a la picadura de pulgas en nosotros los perros es una de las principales causas de dermatitis.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Sintomatologia',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign
                      .center, // Esto centrará el texto horizontalmente
                ),
                const SizedBox(height: 10.0),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '1. Me rasco y me lamo con frecuencia.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '2. Piel enrojecida o prurito: que me aparece con más frecuencia en los costados, los muslos, el vientre, la parte baja de la espalda, el cuello y las orejas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '3. Ronchas: se encuentran en el centro de la zona enrojecida.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '4. Heridas: debido a que me lamo y me rasco demasiado es frecuente que las ronchas se transformen en heridas o pápulas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '5. Alopecia: yo me puedo arrancar el pelo mientras me lamo o rasco. ',
                  textAlign: TextAlign.justify,
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
      items: ['assets/demartitispulgas.jpg'].map((imagePath) {
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
                    player.play(AssetSource('DERMATITIS_POR_PULGAS.mp3'));
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
    home: DermatitisPulgas(),
  ));
}