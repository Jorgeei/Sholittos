import 'package:flutter/material.dart';
import 'package:sholittos/src/page/higiene_gato/informacion_higiene/shampoo_espumoso.dart';
import 'package:sholittos/src/page/higiene_gato/informacion_higiene/shampoo_gato.dart';
import 'package:sholittos/src/page/higiene_gato/informacion_higiene/tratamiento_acondicionador.dart';

class ProductosGato extends StatelessWidget {
  const ProductosGato({Key? key}) : super(key: key);

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
                      'Shampoo Espumoso En Seco Gato',
                      'assets/SHAMPOO_ESPUMOSO_EN_SECO_GATO.png',
                      const ShampooSeco()),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(context, 'Shampoo Gato',
                      'assets/SHAMPOO_GATOS.png', const ShampooGato()),
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
                      'Tratamiento Acondicionador',
                      'assets/TRATAMIENTO_ACONDICIONADOR.png',
                      const TratamientoAcondicionadorDos()),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: _cardTipo1(
                    context,
                    'Tratamiento Acondicionador',
                    'assets/TRATAMIENTO_ACONDICIONADOR.png',
                    const TratamientoAcondicionadorDos(),
                    invisible: true,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20))
          ],
        ),
      ),
    );
  }
}

Widget _cardTipo1(
    BuildContext context, String texto, String imagePath, Widget page,
    {bool invisible = false}) {
  double cardHeight = 300.0; // Adjust the card height as needed

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
        elevation: 5.0,
        child: SizedBox(
          height: cardHeight,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4 / 4, // Fixed aspect ratio (4:3)
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
                      const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
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
