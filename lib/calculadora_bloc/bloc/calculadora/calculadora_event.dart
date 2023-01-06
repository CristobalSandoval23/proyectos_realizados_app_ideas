part of 'calculadora_bloc.dart';

abstract class CalculadoraEvent {}

class ServiceCalculadoraEvent extends CalculadoraEvent {
    String textoAMostrar = "";
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
          //  emit(UsuarioInitial(text: textoAMostrar));

    }

}