import 'package:flutter/material.dart';
import 'package:sholittos/src/page/infomacion_perro/otitis.dart';

import '../infomacion_perro/pulgas.dart';

class Orejas extends StatelessWidget {
  const Orejas({Key? key}) : super(key: key);

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
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 160.0, right: 16.0, left: 16.0),
          itemCount: 1, // Dos tarjetas por fila
          itemBuilder: (BuildContext context, int rowIndex) {
            return Row(
              children: [
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Otitis',
                    'assets/otitis.jpg',
                    const Otitis(),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Pulgas',
                    'assets/pulgas1.jpg',
                    const Pulgas(),
                  ),
                ),
              ],
            );
          },
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
