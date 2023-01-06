import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/pomodoro/service/pomodoro_service.dart';
class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {

  Duration duracion = const Duration();
  int seriesMinutos = 1,
      descansoMinutos = 1;  
  String seleccionadoList = "Serie";     
  String timerSerieString ="1 min";
  bool iniciar =true;
  String tablero ="00:00";
  String timerDescansoString ="1 min";
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final pomodoroService = Provider.of<PomodoroService>(context);
    Future.delayed(Duration.zero, () async {
    if(pomodoroService.timer == "00:00"){

      (seleccionadoList == "Descanso")?seleccionadoList = "Serie": seleccionadoList = "Descanso";
      pomodoroService.duration = Duration(minutes: (seleccionadoList  == "Descanso")? descansoMinutos:seriesMinutos);
      pomodoroService.timerStart();
      setState(() {
        
      });
    }
});


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const  Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text("Pomodoro", style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.height/1.5,
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                         color: Colors.amber,
                         borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Text(seleccionadoList, style: TextStyle(fontSize: 30)),
                           Text(pomodoroService.timer, style: const TextStyle(fontSize: 80),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (iniciar)
                          ?
                          Boton(
                            icon: Icons.start_outlined, 
                            texto: 'Start', 
                            pomodoro: pomodoroService, 
                          )
                          :
                          Boton(
                            icon: Icons.start_outlined, 
                            texto: 'Pause', 
                            pomodoro: pomodoroService, 
                          ),
                          Boton(
                            pomodoro: pomodoroService, 
                            icon: Icons.refresh, 
                            texto: 'Reset'
                          )
                        ],
                      )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                     
                  child:
                  Container(
                     decoration: const BoxDecoration(
                         color: Colors.blue,                         
                         borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          caja(
                            pomodoro: pomodoroService,
                            title: "Series",
                            colorIcon: Colors.red,
                            iconLeft: Icons.arrow_downward, 
                            iconRight: Icons.arrow_upward, 
                            texto: timerSerieString),
                          caja(
                            pomodoro: pomodoroService,
                            title: "Descanso",
                            colorIcon: Colors.red,
                            iconLeft: Icons.arrow_downward, 
                            iconRight: Icons.arrow_upward, 
                            texto: timerDescansoString),
            
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }

  GestureDetector Boton({required String texto,required IconData icon, required PomodoroService pomodoro }) {
    return GestureDetector(
      onTap: () {
        switch (texto) {
          case "Start":
            pomodoro.permitir = true;
            pomodoro.timerStart();
            iniciar = false;
            break;
          case "Pause":
            pomodoro.permitir = false;
            pomodoro.timerPause();
            iniciar = true;

            break;
          case "Reset":
            pomodoro.timerCancel();
            seleccionadoList = "Serie";
            pomodoro.duration = Duration(minutes: seriesMinutos);
            iniciar = true;
            break;
          default:
        }

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),                    
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon),
                            Text(texto)
                          ],
                        ),
                      ),
      ),
    );
  }

  Column caja({required String title, required IconData iconLeft, required IconData iconRight, required String texto, required Color colorIcon, required PomodoroService pomodoro}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if(iniciar){
                aumentarOrDisminuir(
                  comparar: title, 
                  aumentarOrDisminuirElegir: '-', 
                  pomodoro: pomodoro);

                }
                
               setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconLeft, color: colorIcon,),
              ),
            ),
             Text(texto),
            GestureDetector(
              onTap: () {

                if(iniciar){
          aumentarOrDisminuir(
            comparar: title, 
            aumentarOrDisminuirElegir: '+',
            pomodoro: pomodoro);

                }
                
               setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconRight, color: colorIcon),
              ),
            )
          ],
        )
      ],
    )  ;
  }
  
  void aumentarOrDisminuir({required String comparar, required String aumentarOrDisminuirElegir, required PomodoroService pomodoro}) {

       int minutos;
                 (comparar == "Series") ? minutos = seriesMinutos: minutos = descansoMinutos; 
                ((aumentarOrDisminuirElegir == "+") ? minutos == 100:minutos ==1) 
                 ?(aumentarOrDisminuirElegir == "+")? minutos = 100 : minutos = 1
                 :(aumentarOrDisminuirElegir == "+")? minutos += 1: minutos -= 1;
                 (comparar == "Series") ? seriesMinutos = minutos: descansoMinutos = minutos; 
                (comparar == "Series") ?timerSerieString = "$minutos min":timerDescansoString = "$minutos min"; 
                pomodoro.duration = Duration(minutes: seriesMinutos);
  }
}