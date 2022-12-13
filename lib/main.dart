import 'package:flutter/material.dart';
import 'package:proyectos_flutter/bordes_radius_preview_app/page/bordes_radius_preview_page.dart';
import 'package:proyectos_flutter/color_cycle_app/page/color_cycle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "bordes_radius_preview",
      routes: {
        "color_cycle": ( _ ) => const ColorCyclePage(),
        "bordes_radius_preview": ( _ ) => const BordesRadiusPreviewPage(),
      },
    );
  }
}