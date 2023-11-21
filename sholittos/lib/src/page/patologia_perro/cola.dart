import 'package:flutter/material.dart';
import 'package:sholittos/src/page/infomacion_perro/caida_pelo.dart';

import '../infomacion_perro/pulgas.dart';

class Cola extends StatelessWidget {
  const Cola({Key? key}) : super(key: key);

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
        child: ListView(
          padding: const EdgeInsets.only(top: 160.0, right: 16.0, left: 16.0),
          children: [
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Caida de pelo',
                    'assets/cola.jpg',
                    const CaidaPelo(),
                  ),
                ),
                const SizedBox(width: 20), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Pulgas',
                    'assets/pulgas1.jpg',
                    const Pulgas(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

Widget _cardTipo1(
    BuildContext context, String texto, String imagePath, Widget page) {
  double cardHeight = 200.0;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Ajusta el radio del borde aquí
      ),
      elevation: 5.0,
      child: SizedBox(
        height: cardHeight,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4 / 3, // Fixed aspect ratio (4:3)
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: AssetImage(imagePath),
                  fadeInDuration: const Duration(milliseconds: 500),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  texto,
                  style: const TextStyle(fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
