import 'package:flutter/material.dart';
import 'package:sholittos/src/page/patologia_gato/panza.dart';
import 'package:sholittos/src/page/patologia_gato/patasg.dart';

import 'colag.dart';
import 'cuellog.dart';
import 'oreja.dart';

class GatoPage extends StatelessWidget {
  const GatoPage({super.key});

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
            image: AssetImage('assets/slecciongato.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  _buildButton(
                    context,
                    'assets/botongato2.png',
                    'Orejas',
                    const OrejasG(),
                  ),
                  const SizedBox(height: 0),
                  _buildButton(
                    context,
                    'assets/botongato2.png',
                    'Cuello',
                    const CuelloG(),
                  ),
                  const SizedBox(height: 0),
                  _buildButton(
                    context,
                    'assets/botongato2.png',
                    'Lomo',
                    const Panza(),
                  ),
                  const SizedBox(height: 0),
                  _buildButton(
                    context,
                    'assets/botongato2.png',
                    'Patas',
                    const PatasG(),
                  ),
                  const SizedBox(height: 0),
                  _buildButton(
                    context,
                    'assets/botongato2.png',
                    'Cola',
                    const ColaG(),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Content on the right side goes here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String imagePath, String buttonText,
      Widget pageToNavigate) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
          ), // Ajusta el relleno para mover la imagen hacia la derecha
          child: Image.asset(
            imagePath,
            width: 120,
            height: 90,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 32.0), // Ajusta la cantidad de relleno
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageToNavigate),
                );
              },
              child: Container(
                color: Colors.transparent, // Elimina la sombra
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 20.0, // Tamaño del texto
                    color: Colors.black, // Color del texto
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
