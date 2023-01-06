import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_flutter/calculadora_bloc/bloc/calculadora/calculadora_bloc.dart';

class ButtonBlocWidget extends StatelessWidget {
  final dynamic elemento;
  final Color color;
  
  const ButtonBlocWidget({super.key, 
  required this.elemento, 
  required this.color});

  @override
  Widget build(BuildContext context) {
   final calculadoraBloc = BlocProvider.of<CalculadoraBlocService>(context, listen: false);
      double height =  MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){
          
        if (elemento.runtimeType == String) {

          // calculadoraBloc.add(event)

            //  if(elemento == "=") cubit.calcular();
            //  if(elemento == "AC") cubit.limpiarTexto();

            //   cubit.agregarNumero(elemento);
            // } else {

            //   if(elemento == Icons.backspace) cubit.borrarNumero();

            }
        },
        child: Container(
          color: color,
          alignment: Alignment.center,
          child:(elemento.runtimeType == String) ? Text(elemento, style: TextStyle(fontSize: height/20)): Icon(elemento)),
      );
  }

}

