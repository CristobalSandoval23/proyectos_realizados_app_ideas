import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/calculadora_provider/service/calculadora_service.dart';

class ButtonWidget extends StatelessWidget {
  final dynamic elemento;
  final Color color;
  
  const ButtonWidget({super.key, 
  required this.elemento, 
  required this.color});

  @override
  Widget build(BuildContext context) {
    final calculadoraService = Provider.of<CalculadoraService>(context);

      double height =  MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){
          
        if (elemento.runtimeType == String) {
          print("entre");
             if(elemento == "=") calculadoraService.calcular();
             if(elemento == "AC") calculadoraService.limpiarTexto();

              calculadoraService.agregarNumero(elemento);
            } else {
              calculadoraService.borrarNumero();

            }
        },
        child: Container(
          color: color,
          alignment: Alignment.center,
          child:(elemento.runtimeType == String) ? Text(elemento, style: TextStyle(fontSize: height/20)): Icon(elemento)),
      );
  }

}

