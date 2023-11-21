import 'package:flutter/material.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/colonia.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/espumoso_perro_limpieza.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/shampoo_control_caida.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/shampoo_repelente.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/shampoo_repelente_dos.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/shampoo_ronchas.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/shampoo_ronchas_dos.dart';
import 'package:sholittos/src/page/higiene_perro/informacion_higiene/tratamiento_acondicionador.dart';

class ProductosPerro extends StatelessWidget {
  const ProductosPerro({Key? key}) : super(key: key);

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
                  child: _cardTipo1(context, 'Colonia', 'assets/COLONIA.png',
                      const Colonia()),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(
                      context,
                      'Espumoso Perro Limpieza ',
                      'assets/ESPUMOSO_PERRO_LIMPIEZA.png',
                      const EspumosoLimpieza()),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(context, 'Shampoo Control Caida',
                      'assets/SHAMPOO_CONTROL_CAIDA.png', const ShampooCaida()),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(
                      context,
                      'Shampoo Repelente',
                      'assets/SHAMPOO_REPELENTE (2).png',
                      const ShampooRepelente()),
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
                      'Shampoo Repelente',
                      'assets/SHAMPOO_REPELENTE.png',
                      const ShampooRepelenteDos()),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(context, 'Shampoo Ronchas',
                      'assets/SHAMPOO_RONCHAS (2).png', const ShampooRonchas()),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(context, 'Shampoo Ronchas',
                      'assets/SHAMPOO_RONCHAS.png', const ShampooRonchasDos()),
                ),
                const SizedBox(width: 20.0), // Espacio entre las tarjetas
                Expanded(
                  child: _cardTipo1(
                      context,
                      'Tratamiento y Acondicionador',
                      'assets/TRATAMIENTO_ACONDICIONADOR.png',
                      const TratamientoAcondicionador()),
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
    BuildContext context, String texto, String imagePath, Widget page) {
  double cardHeight = 300.0; // Adjust the card height as needed

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
  );
}
