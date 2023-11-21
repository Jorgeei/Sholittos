import 'package:flutter/material.dart';
import 'package:sholittos/src/page/infomacion_perro/hongos.dart';

class Patas extends StatelessWidget {
  const Patas({Key? key}) : super(key: key);

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
                    'Dermatitis en Perros por Hongos',
                    'assets/patas.jpeg',
                    const DermatitisHongos(),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Dermatitis en Perros por Hongos',
                    'assets/patas.jpeg',
                    const DermatitisHongos(),
                    invisible: true, // Hace invisible la segunda tarjeta
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
    BuildContext context, String texto, String imagePath, Widget page,
    {bool invisible = false}) {
  double cardHeight = 250.0;

  // Controla la visibilidad de la tarjeta
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
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0, // Establece la elevación a 0 para eliminar la sombra
        color: Colors.white, // Establece el color a transparente
        child: SizedBox(
          height: cardHeight,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: AssetImage(imagePath),
                    fadeInDuration: const Duration(milliseconds: 500),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
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
