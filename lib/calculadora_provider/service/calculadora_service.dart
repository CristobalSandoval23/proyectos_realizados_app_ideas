import 'package:flutter/material.dart';

class CalculadoraService extends  ChangeNotifier  {

      String textoAMostrar= "";
      bool bloquear = false;

      List<String> elementosEspeciales = [ "/","x", "+", "-", ".", "="];

     agregarNumero(String numero){
      notifyListeners();
      if(numero == "0" && (textoAMostrar == "" || textoAMostrar == "0" ) || numero == "AC") return;
      for (var element in elementosEspeciales) {
        if (element == numero)bloquear = true;

        if(textoAMostrar.contains(element) && elementosEspeciales.contains(numero)){
          notifyListeners();
          return;
        }
        
        if((numero == element && (textoAMostrar == "" || textoAMostrar == "0$element"))) {          
          bloquear = true;

          textoAMostrar = "0$element";

         textoAMostrar = "0$element";
         return notifyListeners();
         }    
      }
      
          (numero == "=") 

           ? textoAMostrar = "$numero$textoAMostrar"
                
            

           : textoAMostrar = "$textoAMostrar$numero";

          notifyListeners();
    }
     calcular(){  
      notifyListeners();    
        bloquear = false;
      
        for (var element in elementosEspeciales) {
        final dataString  = textoAMostrar.split(element);
           if(dataString.last == "")return;
            if(textoAMostrar.contains(element)){
              switch (element) {
                case "+":
                textoAMostrar = (int.parse(dataString[0])+int.parse(dataString[1])).toString();
                  break;
                case "-":
                textoAMostrar = (int.parse(dataString[0])-int.parse(dataString[1])).toString();               
                  break;
                case "/":
                  textoAMostrar = (int.parse(dataString[0])/int.parse(dataString[1])).toString();                                  
                  break;
                case "x":
                  textoAMostrar = (int.parse(dataString[0])*int.parse(dataString[1])).toString();                                  
                  break;
                default: return;
              }
            }
      }
          notifyListeners();
    }

     borrarNumero(){
          notifyListeners();
          if(textoAMostrar == "") return;

          final listString = textoAMostrar.split('');
          listString.removeLast();
          textoAMostrar = listString.join();

          notifyListeners();
    }
     limpiarTexto(){
          notifyListeners();
          if(textoAMostrar == "") return;

          textoAMostrar = "";

          notifyListeners();
    }

    String get textMostrar {

      return textoAMostrar;
    }
  
}