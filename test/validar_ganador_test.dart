import 'package:flutter_app_prueba/src/models/tablero_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_prueba/src/bloc/tablero_bloc.dart';

void main() {
  test('Jugador Ganador Test', () {
    var result = TableroBloc.confirmarGanador('');
    expect(result, false);
  });

  /*test('validar tablero ganador', () {
    var tableroTest =
    Tablero(celdas: ['', '', '', '', '', '', '', '', '']);

    var result = TableroBloc.validarGanador(tableroTest);
    expect(result, false);
  });*/
}