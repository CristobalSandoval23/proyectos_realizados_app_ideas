import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectos_flutter/calculadora_getx/controller/calculadora_controller.dart';

class ButtonGetXWidget extends StatelessWidget {
  final dynamic elemento;
  final Color color;
  
  const ButtonGetXWidget({super.key, 
  required this.elemento, 
  required this.color});

  @override
  Widget build(BuildContext context) {
    final calculadoraGetx = Get.find<ControllerCalculadora>();

      double height =  MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){

        if (elemento.runtimeType == String) {

             if(elemento == "=") calculadoraGetx.calcular();
             if(elemento == "AC") calculadoraGetx.limpiarTexto();

              calculadoraGetx.agregarNumero(elemento);
            } else {
              print(elemento.runtimeType.hashCode);
              calculadoraGetx.borrarNumero();

            }
        },
        child: Container(
          color: color,
          alignment: Alignment.center,
          child:(elemento.runtimeType == String) ? Text(elemento, style: TextStyle(fontSize: height/20)): Icon(elemento)),
      );
  }

}

