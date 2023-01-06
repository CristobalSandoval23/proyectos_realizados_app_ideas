import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

class ChristmasLightsPage extends StatefulWidget {
  const ChristmasLightsPage({super.key});

  @override
  State<ChristmasLightsPage> createState() => _ChristmasLightsPageState();
}

class _ChristmasLightsPageState extends State<ChristmasLightsPage> {
 
  bool activar = true;
  String activaLuz = "impar";
  int speed = 1;
  @override
  void initState() {
    super.initState();
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

 List<Color> coloresList = [Colors.red, Colors.amber, Colors.cyan, Colors.green,Colors.red, Colors.amber, Colors.cyan, Colors.green];
  @override
  Widget build(BuildContext context) {

    print(speed);
  PausableTimer timer =   PausableTimer( Duration(seconds: speed), (){
        (activaLuz == "par") ? activaLuz = "impar" : activaLuz = "par"; 
    if(!activar){ activaLuz = ""; speed = 1;}
        setState(() {
          
        });
  });
  (activar ) ? timer.start() : timer.cancel();
  

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Text(speed.toString()),
        onPressed: () {
        (speed > 4) ? speed = 1:speed ++;
      },),
      body: Column(
        
        children: [
         const  SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(8, (index) {

          return Stack(
            children: [
              Row(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.amber,),
                  ),
                    (index == 7) ? Container() : SizedBox(                    
                      height: 10,
                      width: 40, 
                      child:CustomPaint(painter: MiLinea()),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:   BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.solid,
                        color: (activar) ? coloresList[index]: Colors.grey, 
                        blurRadius:(parOImpar(index.toDouble()) == activaLuz) ? 20: 0, 
                        )
                    ],
                    color: (activar) ? coloresList[index]: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(100))), 
                ),
              ),
            ],
          );}
          ),
          ),
         const  SizedBox(height: 30,),
         const  Text("Christmas Lights", style: TextStyle(color: Colors.white,fontSize: 60),),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Switch.adaptive(
                value: activar, 
                onChanged:(value) {
                  activar = value;
                  
                  setState(() {
                    
                  });
                },),
             const  Padding(
                padding:  EdgeInsets.only(left: 10, right: 10),
                child:  Text("Speed", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: TextFormField(
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  initialValue: "",
                  onChanged: (value) {
                    
                  },
                ),
              )
         ],), 
        ],
      ),
    );
  }
}

   String parOImpar(double numero){
       String respuesta;
       double  resultado = (numero % 2) ;
  
       if(resultado == 0){
        respuesta = "par";
       } else{
        respuesta = "impar";
       }
       return respuesta;
    }
class MiLinea extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
                  ..color = Colors.white
                  ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width *0.5, size.height+10, size.width, size.height * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MiLinea oldDelegate) => true;

}