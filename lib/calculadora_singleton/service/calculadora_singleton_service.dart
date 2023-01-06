
import 'dart:async';

class _CalculadoraSingletonService {
    String textoAMostrar= "";
      bool bloquear = false;

    // broadcast permite que el stream sea escuchado en varios StremBuilder a la vez
    StreamController<String> _streamController = StreamController<String>.broadcast();  

    Stream<String> get  streamController => _streamController.stream;


      List<String> elementosEspeciales = [ "/","x", "+", "-", ".", "="];

     agregarNumero(String numero){

      if(numero == "0" && (textoAMostrar == "" || textoAMostrar == "0" ) || numero == "AC") return;
      for (var element in elementosEspeciales) {
        if (element == numero)bloquear = true;

        if(textoAMostrar.contains(element) && elementosEspeciales.contains(numero)){
          return;
        }
        
        if((numero == element && (textoAMostrar == "" || textoAMostrar == "0$element"))) {          
          bloquear = true;

          textoAMostrar = "0$element";

         textoAMostrar = "0$element";
         return "";
         }    
      }
      
          (numero == "=") 

           ? textoAMostrar = "$numero$textoAMostrar"
                
            

           : textoAMostrar = "$textoAMostrar$numero";

      _streamController.add(textoAMostrar);
    }

     calcular(){  
 
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
             _streamController.add(textoAMostrar);
      }

    }

     borrarNumero(){

          if(textoAMostrar == "") return;

          final listString = textoAMostrar.split('');
          listString.removeLast();
          textoAMostrar = listString.join();
         _streamController.add(textoAMostrar);

    }
     limpiarTexto(){
          if(textoAMostrar == "") return;

          textoAMostrar = "";
         _streamController.add(textoAMostrar);
    }

}

final calculadoraSingletonService = _CalculadoraSingletonService();