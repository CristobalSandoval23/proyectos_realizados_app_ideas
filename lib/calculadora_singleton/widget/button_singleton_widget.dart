import 'package:flutter/material.dart';
import 'package:proyectos_flutter/calculadora_singleton/service/calculadora_singleton_service.dart';

class ButtonSingletonWidget extends StatelessWidget {
  final dynamic elemento;
  final Color color;
  
  const ButtonSingletonWidget({super.key, 
  required this.elemento, 
  required this.color});

  @override
  Widget build(BuildContext context) {

      double height =  MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){
          
        if (elemento.runtimeType == String) {
          print("entre");
             if(elemento == "=") calculadoraSingletonService.calcular();
             if(elemento == "AC") calculadoraSingletonService.limpiarTexto();

              calculadoraSingletonService.agregarNumero(elemento);
            } else {
              if (elemento == Icons.backspace) calculadoraSingletonService.borrarNumero();

            }
        },
        child: Container(
          color: color,
          alignment: Alignment.center,
          child:(elemento.runtimeType == String) ? Text(elemento, style: TextStyle(fontSize: height/20)): Icon(elemento)),
      );
  }

}

