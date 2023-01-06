import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/calculadora_provider/service/calculadora_service.dart';
import 'package:proyectos_flutter/calculadora_provider/widget/button_widget.dart';
import 'package:proyectos_flutter/calculadora_singleton/service/calculadora_singleton_service.dart';
import 'package:proyectos_flutter/calculadora_singleton/widget/button_singleton_widget.dart';


class CalculadoraSingletonPage extends StatelessWidget {
  const CalculadoraSingletonPage({super.key});


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
      appBar: AppBar(title: StreamBuilder<String>(
        stream: calculadoraSingletonService.streamController,
        builder: (context,AsyncSnapshot<String> snapshot) {
          print(snapshot.data);
        return snapshot.hasData
         ? Text(snapshot.data.toString())
         :const Text("Pagina inicial");
      },)),
      body: StreamBuilder<String>(
        stream: calculadoraSingletonService.streamController,
        builder: (context,AsyncSnapshot<String> snapshot) {
          print(snapshot.data);
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: MediaQuery.of(context).size.height/2,
                child: (snapshot.data != null) ?Text(snapshot.data.toString()):const Text(""),
                ),
              GridView.builder(
                itemCount: elementosCalculadora.length,
                shrinkWrap: true, 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
                  crossAxisCount: 4,
                  mainAxisExtent: MediaQuery.of(context).size.height/12,
                  ),
                itemBuilder: (BuildContext context, int index) { 
                  return  ButtonSingletonWidget(elemento: elementosCalculadora[index], color: Colors.red);
                 },
                
                ),
            ],
          );
        }
      )
    );
  }
}