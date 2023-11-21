import 'package:flutter/material.dart';
import 'package:sholittos/src/page/patologia_perro/cola.dart';
import 'package:sholittos/src/page/patologia_perro/cuello.dart';
import 'package:sholittos/src/page/patologia_perro/lomo.dart';
import 'package:sholittos/src/page/patologia_perro/orejas.dart';
import 'package:sholittos/src/page/patologia_perro/patas.dart';

class PerroPage extends StatelessWidget {
  const PerroPage({Key? key}) : super(key: key);

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
            image: AssetImage('assets/pantalla4.jpg'),
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
                    'assets/seleccion_perro.png',
                    'Orejas',
                    const Orejas(),
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                    context,
                    'assets/seleccion_perro.png',
                    'Cuello',
                    const Cuello(),
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                    context,
                    'assets/seleccion_perro.png',
                    'Patas',
                    const Patas(),
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                    context,
                    'assets/seleccion_perro.png',
                    'Lomo',
                    const Lomo(),
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                    context,
                    'assets/seleccion_perro.png',
                    'Cola',
                    const Cola(),
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
            height: 60,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 19.0), // Ajusta la cantidad de relleno
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageToNavigate),
                );
              },
              child: Container(
                color: Colors.transparent,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 17.0, // Tamaño del texto
                    color: Colors.white, // Color del texto
                  ),
                ),
                // Elimina la sombra
              ),
            ),
          ),
        ),
      ],
    );
  }
}
