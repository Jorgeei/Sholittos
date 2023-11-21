import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:async';
import 'package:sholittos/perro_gato.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Spikint",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context, // Usamos pushReplacement para reemplazar la pantalla actual
        MaterialPageRoute(builder: (context) => const HomePagePatologia()),
      );
    });

    return WillPopScope(
      onWillPop: () async => false, // Evita el retroceso mientras se carga
      child: const Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 231, 94),
        body: Center(
          child: SpinKitCircle(
            color: Colors.lightBlueAccent,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
