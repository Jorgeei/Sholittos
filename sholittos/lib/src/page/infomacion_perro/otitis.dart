import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Otitis extends StatelessWidget {
  const Otitis({Key? key}) : super(key: key);

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
                    'Otitis',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign
                        .center, // Esto centrará el texto horizontalmente
                  ),
                ),
                const SizedBox(height: 20.0),
                _carrusel(),
                const SizedBox(height: 20.0),
                const AudioPlayerWidget(),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'El cuidado durante el proceso de nuestra limpieza es uno de los factores importantes para mantener nuestra salud y el bienestar especialmente para evitar la inflamación. La otitis es un problema que tiene varias causas y puede estar relacionado con la limpieza de nuestros oídos en casa y también en los groomer.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'La higienización siempre es importante, pero hay que hacerla correctamente y hay que evitar que el chorro de agua llegue a nuestro conducto auditivo, nuestras orejas también necesitan secarse muy bien después del baño, esto se debe a que la humedad favorece el desarrollo de otitis y facilita la proliferación de microorganismos como bacterias, hongos y parásitos. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Síntomas que podemos presentar',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '1. Dolor de oídos.  intentamos rascarnos, sacudimos nuestra cabeza y nos quejamos de dolor.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '2. Presencia anómala de cera en nuestros oídos, secreciones y mal olor procedente de mis orejas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '3. Si la otitis evoluciona y se agrava, pasando de una otitis externa a una media o interna, puede hacer que camine ladeado, me maree o tenga nauseas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Cómo me puedes prevenir la otitis',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '1. Como en cualquier enfermedad, la prevención es esencial.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '2. La humedad favorece las infecciones de oído, asegúrate de secarme bien las orejas cada vez que se mojen ya sea porque me bañaste, porque me gusta de nadar o por la lluvia.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '3. El control de alergias y de enfermedades crónicas subyacentes también ayuda a evitar los cuadros de otitis.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '4. Algunos ácaros pueden ser responsables de la otitis por lo que la desparasitación externa es otro factor a considerar dentro de la prevención.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '5. Revísame periódicamente mis orejas en busca de pasto, espigas y objetos extraños que puedan causar irritación o inflamación.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '6. Mantenme las orejas siempre limpias y recuerda preguntar al veterinario ante cualquier duda.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Sintomatología',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Cuando hay una aparición de otitis, sacudimos mucho la cabeza o nos rascamos las orejas en exceso, algunos presentamos secreciones, enrojecimiento y desarrollamos un olor mas fuerte de lo normal, en algunos casos más graves podemos mostrar desorientación y desequilibrio.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
                const Padding(padding: EdgeInsets.all(20))
                // Agregamos el reproductor de audio aquí
              ],
            ),
          ),
        ),
      ),
    );
  }

  _carrusel() {
    return CarouselSlider(
      items: ['assets/otitis.jpg'].map((imagePath) {
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
                    player.play(AssetSource('OTITIS.mp3'));
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
    home: Otitis(),
  ));
}
