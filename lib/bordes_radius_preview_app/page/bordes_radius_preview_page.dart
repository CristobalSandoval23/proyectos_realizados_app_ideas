import 'package:flutter/material.dart';
import 'dart:math' as math;

class BordesRadiusPreviewPage extends StatefulWidget {
  const BordesRadiusPreviewPage({super.key});

  @override
  State<BordesRadiusPreviewPage> createState() => _BordesRadiusPreviewPageState();
}

class _BordesRadiusPreviewPageState extends State<BordesRadiusPreviewPage> {

  double topLeft = 0;
  double topRight = 0;
  double bottomLeft = 0;
  double bottomRight = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               slider(angulo: "90", border: "topLeft"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               slider( border: "topRight"),
                Container(
                  width: 100,
                  height: 100,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(topLeft),
                      topRight: Radius.circular(topRight),
                      bottomLeft: Radius.circular(bottomLeft),
                      bottomRight: Radius.circular(bottomRight),
                      ),
                    color: Colors.red,),),
               slider( border: "bottomLeft"),
              
              ],
            ),
               slider(angulo: "90", border: "bottomRight"),
            
        ],),
      )
    );
  }
  
  Widget slider({String angulo = "0", String border = "topLeft"}) {
   double angle = 0;
  switch (angulo) {
    case "0":
     angle=  0; 
      break;
    case "90":
     angle=  math.pi/2; 
      break;
    default:
  }


  return SizedBox(
    height: (angulo == "90")? 100: 30,
    width: (angulo == "90")? 30: 100,
    child: Transform.rotate(
          angle: angle,
          child: Slider(
            min: 0,
            max: 100,
            thumbColor: Colors.amber,
            value: valor(border), 
            onChanged:(value) {
               valorSeleccionado(border, value);
            setState(() {
            });
          },),
        ),
  );
  }

 double valor(String border){
  double seleccionado;
     switch (border) {
    case "topLeft":
      seleccionado = topLeft; 
      break;
    case "topRight":
     seleccionado = topRight ; 
      break;
    case "bottomLeft":
      seleccionado = bottomLeft ; 
      break;
    default:  seleccionado = bottomRight;
  }
  return seleccionado;
  }
  
  valorSeleccionado(String border, double valor) {
        switch (border) {
    case "topLeft":
       topLeft = valor; 
      break;
    case "topRight":
     topRight  = valor; 
      break;
    case "bottomLeft":
      bottomLeft = valor; 
      break;
    default: bottomRight = valor;
  }
  }
  
}
