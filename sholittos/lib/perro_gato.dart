import 'package:flutter/material.dart';
import 'package:sholittos/higiene_patologia_gato.dart';
import 'package:sholittos/higiene_patologia_perro.dart';

class HomePagePatologia extends StatelessWidget {
  const HomePagePatologia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pantalla1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            const Padding(padding: EdgeInsets.all(45)),
            _botones(context, 'assets/boton_perro.jpg',
                const HigienePatologiaPerro()),
            const SizedBox(height: 40),
            _botones(
                context, 'assets/boton_gato.jpg', const HigienePatologiaGato()),
          ],
        ),
      ),
    );
  }

  Widget _botones(
      BuildContext context, String imagePath, Widget pageToNavigate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageToNavigate),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0), // Ajusta el radio de borde
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
