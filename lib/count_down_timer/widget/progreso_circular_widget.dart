import 'dart:math';

import 'package:flutter/material.dart';

class ProgresoCircularWidget extends StatefulWidget {
  final double porcentaje ;
  final double totalPorcentaje ;
  final Color colorBorderCirculo ;
  final Color colorCirculo ;
  final String texto ;
  const ProgresoCircularWidget( {super.key, required this.porcentaje, required this.colorBorderCirculo, required this.colorCirculo, required this.texto, required this.totalPorcentaje});

  @override
  State<ProgresoCircularWidget> createState() => _ProgresoCircularWidgetState();
}

class _ProgresoCircularWidgetState extends State<ProgresoCircularWidget> with SingleTickerProviderStateMixin {
late AnimationController controller; 
late double porcentajeAnterior;
  @override
  void initState() {
    // TODO: implement initState
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, builder: ((context, child) {
            return  SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                painter: _CirculoPainter(
                  totalPorcentaje:widget.totalPorcentaje,
                  porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), 
                  colorBorderCirculo: widget.colorBorderCirculo, 
                  colorCirculo: widget.colorCirculo),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                     Text(widget.porcentaje.toString(), style: TextStyle(fontSize: 40),),
                    Text(widget.texto),
                    ],),
                    )
              );
      }));
  }
}

class _CirculoPainter extends CustomPainter {

  final double porcentaje;
  final double totalPorcentaje;
  final Color colorBorderCirculo;
  final Color colorCirculo;

  _CirculoPainter({required this.totalPorcentaje,required this.porcentaje, required this.colorBorderCirculo,required  this.colorCirculo});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =  Paint()
        ..strokeWidth = 4
        ..color       = colorCirculo
        ..style       = PaintingStyle.stroke;

    Offset center = Offset(size.width/2, size.height/2);

    double radio = min(size.width/2, size.height/2);
    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
        ..strokeWidth = 10
        ..color       = colorBorderCirculo
        ..style       = PaintingStyle.stroke;
    
    double arAngle = 2 * pi * (porcentaje /totalPorcentaje);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arAngle, 
      false, 
      paintArco);
  }

  @override
  bool shouldRepaint(_CirculoPainter oldDelegate) => true;

}