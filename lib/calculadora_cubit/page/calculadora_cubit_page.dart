import 'package:flutter/material.dart';
import 'package:proyectos_flutter/calculadora_cubit/bloc/calculadora/calculadora_cubit.dart';
import 'package:proyectos_flutter/calculadora_cubit/widget/button_cubit_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculadoraCubitPage extends StatelessWidget {
  const CalculadoraCubitPage({super.key});
  
  @override
  Widget build(BuildContext context) {
  IconData volver = Icons.backspace;
    IconData avanzado = Icons.filter;
    
    List elementosCalculadora = ["AC", volver,"%","/",
                                    "7","8","9","x",
                                    "4","5","6","-",
                                    "1","2","3","+",
                                    avanzado,"0",".","="];
   // Aunque no se utilice explicitamente sus funciones, se necesita ejercutar para
   // poder actulizar los elementos que se modifiquen 

    return  Scaffold(
      body: BlocBuilder<CalculadoraCubit, CalculadoraState>(
        builder: ( _ , state) {
          
          print((state as UsuarioInitial).text);
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: MediaQuery.of(context).size.height/2,
                child: Text(state.text),
                ),
              GridView.builder(
                itemCount: elementosCalculadora.length,
                shrinkWrap: true, 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
                  crossAxisCount: 4,
                  mainAxisExtent: MediaQuery.of(context).size.height/10,
                  ),
                itemBuilder: (BuildContext context, int index) { 
                  return  ButtonCubitWidget(
                    elemento: elementosCalculadora[index], 
                    color: Colors.red);
                 },
                
                ),
            ],
          );
        }
      )
    );
}
}