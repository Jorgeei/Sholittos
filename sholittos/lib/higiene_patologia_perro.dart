import 'package:flutter/material.dart';
import 'package:sholittos/src/page/higiene_perro/perrohigiene.dart';
import 'package:sholittos/src/page/patologia_perro/perropage.dart';

class HigienePatologiaPerro extends StatelessWidget {
  const HigienePatologiaPerro({super.key});

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
            image: AssetImage('assets/pantalla2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Padding(padding: EdgeInsets.all(70)),
            _botones(context, 'assets/botonperro.png', 'Patología',
                const PerroPage()),
            const SizedBox(height: 40),
            _botones(context, 'assets/botonperro.png', 'Higiene',
                const ProductosPerro()),
          ],
        ),
      ),
    );
  }

  Widget _botones(BuildContext context, String imagePath, String buttonText,
      Widget pageToNavigate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageToNavigate),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: SizedBox(
          height: 150.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top:
                            0), // Ajusta el espacio en la parte superior del texto
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 70, 109),
                      ),
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
}
