import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:proyectos_flutter/count_down_timer/provider/count_down_provider.dart';
import 'package:proyectos_flutter/count_down_timer/widget/progreso_circular_widget.dart';


class CountDownTimerPage extends StatelessWidget {
 late TextEditingController dateController;
 late String formattedDate;
 late Duration difference;

 @override
  // void initState() {
  //   formattedDate = "";
  //   difference = const Duration();
  //   dateController = TextEditingController(
  //     text: "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"
  //   );
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    final countDownTimer = Provider.of<CountDownProvider>(context); 
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                decoration: const InputDecoration( 
                          icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                  ),
                readOnly: true,  // when true user cannot edit text 
                onTap: () => pickedDate(context, countDownTimer)
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [         
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ProgresoCircularWidget(
                    totalPorcentaje: 60,
                    porcentaje: countDownTimer.segundo,
                    colorBorderCirculo: Colors.blue,
                    colorCirculo: Colors.black, 
                    texto: 'segundos', 
                    )
             ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ProgresoCircularWidget(
                    totalPorcentaje: 60,
                    porcentaje: countDownTimer.minuto,
                    colorBorderCirculo: Colors.blue,
                    colorCirculo: Colors.black, 
                    texto: 'minutos',)
             ),
            //     SizedBox(
            //       height: 100,
            //       width: 100,
            //       child: ProgresoCircularWidget(
            //         totalPorcentaje: 100,
            //         porcentaje: horas,
            //         colorBorderCirculo: Colors.blue,
            //         colorCirculo: Colors.black, 
            //         texto: 'horas',)
            //  ),
            //     SizedBox(
            //       height: 100,
            //       width: 100,
            //       child: ProgresoCircularWidget(
            //         totalPorcentaje: 100,
            //         porcentaje: dias,
            //         colorBorderCirculo: Colors.blue,
            //         colorCirculo: Colors.black, 
            //         texto: 'dias',)
            //  ),
              ],
            ),
          ],
        ),
      ),);
  }
Future<DateTime?> pickedDate(BuildContext context, CountDownProvider countDownTimer) async{
  DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                   final aa =  pickedDate.toString().split(":")[0].toString();

                      String formattedDate = aa; // format date in required form here we use yyyy-MM-dd that means time is removed
            
                    DateTime today = DateTime.now();
                    final dDay = DateTime.parse(formattedDate);
                      difference = dDay.difference(today);

                      print(difference.inSeconds);

                      countDownTimer.permitir = true;
                      countDownTimer.duration = Duration(seconds: difference.inSeconds);
                      countDownTimer.timerStart();
                 
                    // TODO: se debe de calcular el mes, dia, minutos, segundos para agregarlo al circulo progresivo;
                      // setState(() {
                      //    dateController.text = formattedDate; //set foratted date to TextField value. 
                      // });
                  }else{
                      print("Date is not selected");
                  }
    return pickedDate;
}
}

