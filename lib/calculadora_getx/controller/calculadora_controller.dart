import 'package:get/get.dart';

class ControllerCalculadora extends GetxController {

  var textoAMostrar = "".obs;
  var bloquear = false.obs;
  
  List<String> elementosEspeciales = [ "/","x", "+", "-", ".", "="];

   agregarNumero(String numero){
      
      if(numero == "0" && (textoAMostrar.value == "" || textoAMostrar.value == "0" ) || numero == "AC") return;
      for (var element in elementosEspeciales) {
        if (element == numero)bloquear.value = true;

        if(textoAMostrar.value.contains(element) && elementosEspeciales.contains(numero)){
          
          return;
        }
        
        if((numero == element && (textoAMostrar.value == "" || textoAMostrar.value == "0$element"))) {          
          bloquear.value = true;

          textoAMostrar.value = "0$element";

         return textoAMostrar.value;
         }    
      }
                (numero == "=") 

           ? textoAMostrar.value = "$textoAMostrar"
                
            

           : textoAMostrar.value = "$textoAMostrar$numero";
   }

     calcular(){  

        bloquear.value = false;
      
        for (var element in elementosEspeciales) {
        final dataString  = textoAMostrar.value.split(element);
           if(dataString.last == "")return;
            if(textoAMostrar.value.contains(element)){
              switch (element) {
                case "+":
                textoAMostrar.value = (int.parse(dataString[0])+int.parse(dataString[1])).toString();
                  break;
                case "-":
                textoAMostrar.value = (int.parse(dataString[0])-int.parse(dataString[1])).toString();               
                  break;
                case "/":
                  textoAMostrar.value = (int.parse(dataString[0])/int.parse(dataString[1])).toString();                                  
                  break;
                case "x":
                  textoAMostrar.value = (int.parse(dataString[0])*int.parse(dataString[1])).toString();                                  
                  break;
                default: return;
              }
            }
      }
    }

     borrarNumero(){
          if(textoAMostrar.value == "") return;

          final listString = textoAMostrar.value.split('');
          listString.removeLast();
          textoAMostrar.value = listString.join();

    }
     limpiarTexto(){

          if(textoAMostrar.value == "") return;

          textoAMostrar.value = "";

    }

  String get texto{
    return textoAMostrar.value;
  } 
}