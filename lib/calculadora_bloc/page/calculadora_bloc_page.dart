import 'package:flutter/material.dart';
import 'package:proyectos_flutter/calculadora_bloc/bloc/calculadora/calculadora_bloc.dart';
import 'package:proyectos_flutter/calculadora_bloc/widget/button_bloc_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculadoraBlocPage extends StatelessWidget {
  const CalculadoraBlocPage({super.key});
  
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
      appBar: AppBar(title: const Text("Bloc")),
      body: BlocBuilder<CalculadoraBlocService, CalculadoraState>(
        builder: ( _ , state) {
          print("${state.text} hola");
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: MediaQuery.of(context).size.height/2,
                child: const Text("state"),
                ),
              GridView.builder(
                itemCount: elementosCalculadora.length,
                shrinkWrap: true, 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
                  crossAxisCount: 4,
                  mainAxisExtent: MediaQuery.of(context).size.height/12,
                  ),
                itemBuilder: (BuildContext context, int index) { 
                  return  ButtonBlocWidget(
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