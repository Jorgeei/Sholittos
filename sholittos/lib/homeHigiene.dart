import 'package:flutter/material.dart';
import 'package:sholittos/src/page/higiene_gato/gatohigiene.dart';
import 'package:sholittos/src/page/higiene_perro/perrohigiene.dart';

class HomePageInicio extends StatelessWidget {
  const HomePageInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOLI-CLIC', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(padding: EdgeInsets.all(30)),
          _botones(context, 'assets/perro.jpg', const ProductosPerro()),
          const SizedBox(
            height: 40,
          ),
          _botones(context, 'assets/gato.jpg', const ProductosGato()),
        ],
      ),
    );
  }
}

Widget _botones(BuildContext context, String imagePath, Widget pageToNavigate) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pageToNavigate),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(
          left: 50, right: 50), // Ajusta el valor del padding
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 200.0,
          ),
        ),
      ),
    ),
  );
}
