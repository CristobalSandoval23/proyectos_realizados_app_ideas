import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectos_flutter/calculadora_getx/controller/calculadora_controller.dart';
import 'package:proyectos_flutter/calculadora_getx/widget/button_getx_widget.dart';

class CalculadoraGetXPage extends StatelessWidget {


   CalculadoraGetXPage({super.key});
  //  final data = Get.find<ControllerCalculadora>();

   final controller = Get.put(ControllerCalculadora());

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
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: MediaQuery.of(context).size.height/2,
            child: Obx(() => Text(controller.texto)),
            ),
          GridView.builder(
            itemCount: elementosCalculadora.length,
            shrinkWrap: true, 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
              crossAxisCount: 4,
              mainAxisExtent: MediaQuery.of(context).size.height/10,
              ),
            itemBuilder: (BuildContext context, int index) { 
              return  ButtonGetXWidget(elemento: elementosCalculadora[index], color: Colors.red);
             },
            
            ),
        ],
      )
    );
  }
}