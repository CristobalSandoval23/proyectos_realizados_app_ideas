part of 'calculadora_cubit.dart';

@immutable
abstract class CalculadoraState {}

class UsuarioInitial extends CalculadoraState {
  final String text;

  UsuarioInitial({this.text = ""});
}

// class UsuarioActivo extends CalculadoraState {
//   final existeUsuario = true;
//   final Usuario usuario;

//   UsuarioActivo(this.usuario);

// }
