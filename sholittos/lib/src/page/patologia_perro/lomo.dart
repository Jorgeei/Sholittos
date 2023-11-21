import 'package:flutter/material.dart';
import 'package:sholittos/src/page/infomacion_perro/acaros.dart';
import 'package:sholittos/src/page/infomacion_perro/alergia_pulgas.dart';
import 'package:sholittos/src/page/infomacion_perro/caida_pelo.dart';
import 'package:sholittos/src/page/infomacion_perro/pulgas.dart';
import 'package:sholittos/src/page/infomacion_perro/seborrea.dart';

class Lomo extends StatelessWidget {
  const Lomo({Key? key}) : super(key: key);

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
                    'Seborrea',
                    'assets/lomo.jpg',
                    const Seborrea(),
                  ),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Dermatitis por alergia a picadura de pulgas ',
                    'assets/demartitispulgas.jpg',
                    const DermatitisPulgas(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Caída de pelo',
                    'assets/caidapelo.jpg',
                    const CaidaPelo(),
                  ),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
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
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Acaro',
                    'assets/acaro.jpg',
                    const Acaros(),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Acaro',
                    'assets/acaro.jpg',
                    const Acaros(),
                    invisible: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cardTipo1(
    BuildContext context, String texto, String imagePath, Widget page,
    {bool invisible = false}) {
  double cardHeight = 200.0;
  return Visibility(
    visible: !invisible,
    child: GestureDetector(
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
                aspectRatio: 5 / 4, // Fixed aspect ratio (4:3)
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
                  padding:
                      const EdgeInsets.only(top: 17.0, left: 20.0, right: 20.0),
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
    ),
  );
}
