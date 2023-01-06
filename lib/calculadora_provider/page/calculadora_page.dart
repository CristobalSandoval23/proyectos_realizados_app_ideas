import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/calculadora_provider/service/calculadora_service.dart';
import 'package:proyectos_flutter/calculadora_provider/widget/button_widget.dart';


class CalculadoraProviderPage extends StatelessWidget {
  const CalculadoraProviderPage({super.key});


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
    final calculadoraService = Provider.of<CalculadoraService>(context);

    return  Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: MediaQuery.of(context).size.height/2,
            child: Text(calculadoraService.textMostrar),
            ),
          GridView.builder(
            itemCount: elementosCalculadora.length,
            shrinkWrap: true, 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
              crossAxisCount: 4,
              mainAxisExtent: MediaQuery.of(context).size.height/10,
              ),
            itemBuilder: (BuildContext context, int index) { 
              return  ButtonWidget(elemento: elementosCalculadora[index], color: Colors.red);
             },
            
            ),
        ],
      )
    );
  }
}