import 'package:flutter/material.dart';
import 'package:sholittos/src/page/informacion_gato/dermatitis_solar.dart';

import '../informacion_gato/acarosgato.dart';
import '../informacion_gato/dermatitis_por_estres.dart';
import '../informacion_gato/pulgas_en_gatos.dart';

class OrejasG extends StatelessWidget {
  const OrejasG({Key? key}) : super(key: key);

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
                  child: _cardTipo1(context, 'Dermatitis Solar',
                      'assets/dermatitissolar.jpeg', const DermatitisSolar()),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: _cardTipo1(
                      context,
                      'Dermatitis Por Estrés',
                      'assets/dermatitisporestres.jpeg',
                      const DermatitisEstres()),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: _cardTipo1(context, 'Pulgas En Gatos',
                      'assets/pulgasgato.jpeg', const PulgasG()),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: _cardTipo1(context, 'Ácaros En Gatos',
                      'assets/acaro.jpg', const AcaroG()),
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
