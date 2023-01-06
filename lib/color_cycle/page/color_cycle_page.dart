import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

class ColorCyclePage extends StatefulWidget {
  const ColorCyclePage({super.key});

  @override
  State<ColorCyclePage> createState() => _ColorCyclePageState();
}

class _ColorCyclePageState extends State<ColorCyclePage> {
  final List<Color> colorLista = [Colors.red, Colors.black, Colors.green, Colors.grey, Colors.blue];
  Color colorSeleccionado = Colors.red;
  int incrementar = 0;
  @override
  Widget build(BuildContext context) {

 PausableTimer timer = PausableTimer(const Duration(seconds: 1), (){
        (incrementar == colorLista.length-1) ? incrementar = 0: incrementar++;
        colorSeleccionado = colorLista[incrementar];
      setState(() {});
 });
 timer.start();
    return Scaffold(
      body: AnimatedContainer(
        color: colorSeleccionado, duration: const Duration(seconds: 1),
      ),
    );
  }
}