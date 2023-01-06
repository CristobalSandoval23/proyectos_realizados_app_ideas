import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculadora_state.dart';

class CalculadoraCubit extends Cubit<CalculadoraState> {
  
  CalculadoraCubit() : super( UsuarioInitial() );
  
      String textoAMostrar= "";
      bool bloquear = false;

      List<String> elementosEspeciales = [ "/","x", "+", "-", ".", "="];

     void  agregarNumero(String numero){

      if(numero == "0" && (textoAMostrar == "" || textoAMostrar == "0" ) || numero == "AC") return;
      for (var element in elementosEspeciales) {
        if (element == numero)bloquear = true;

        if(textoAMostrar.contains(element) && elementosEspeciales.contains(numero)){
        
          return;
        }
        
        if((numero == element && (textoAMostrar == "" || textoAMostrar == "0$element"))) {          
          bloquear = true;

          textoAMostrar = "0$element";


         }    
      }
      
          (numero == "=") 

           ? textoAMostrar = "$numero$textoAMostrar"
                
            

           : textoAMostrar = "$textoAMostrar$numero";
           emit(UsuarioInitial(text: textoAMostrar));

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
      }
        
           emit(UsuarioInitial(text: textoAMostrar));
    }

         borrarNumero(){
          if(textoAMostrar == "") return;

          final listString = textoAMostrar.split('');
          listString.removeLast();
          textoAMostrar = listString.join();
           emit(UsuarioInitial(text: textoAMostrar));

    }

         limpiarTexto(){

          if(textoAMostrar == "") return;

          textoAMostrar = "";
           emit(UsuarioInitial(text: textoAMostrar));

    }


}