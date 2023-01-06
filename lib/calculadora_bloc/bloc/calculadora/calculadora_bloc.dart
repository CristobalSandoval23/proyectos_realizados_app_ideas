import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculadora_state.dart';
part 'calculadora_event.dart';


class CalculadoraBlocService extends Bloc<CalculadoraEvent, CalculadoraState>{
  CalculadoraBlocService() : super(const CalculadoraInitial("Hola")){
      on<ServiceCalculadoraEvent>((event, emit) {});

  }
  
  
}