part of 'calculadora_bloc.dart';

@immutable
abstract class CalculadoraState {
  final String text;

  const CalculadoraState({this.text = ""});

}

class CalculadoraInitial extends CalculadoraState {
 final String texto;
  const CalculadoraInitial(this.texto): super(text: texto) ;
}
