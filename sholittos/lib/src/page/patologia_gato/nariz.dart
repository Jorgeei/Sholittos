import 'package:flutter/material.dart';

import '../informacion_gato/acarosgato.dart';

class Nariz extends StatelessWidget {
  const Nariz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOLI-CLIC'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: _cardTipo1(context, 'Ácaros En Gatos',
                    'assets/acaro.jpg', const AcaroG()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _cardTipo1(
    BuildContext context, String texto, String imagePath, acaroG) {
  return GestureDetector(
    // onTap: () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => page,
    //     ),
    //   );
    // },
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0, // Hacer que la tarjeta sea cuadrada
            child: ClipRRect(
              child: FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: AssetImage(imagePath),
                fadeInDuration: const Duration(milliseconds: 500),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(texto),
          ),
        ],
      ),
    ),
  );
}
