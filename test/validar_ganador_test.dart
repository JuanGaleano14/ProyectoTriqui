import 'package:flutter_app_prueba/src/models/tablero_model.dart';
import 'package:flutter_app_prueba/src/models/turno_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_prueba/src/bloc/tablero_bloc.dart';

void main() {
  test('Jugador Ganador Test', () {
    var result = TableroBloc.confirmarGanador('');
    expect(result, false);
  });
  test('Mostrar Ganador Test', () {
    Tablero mostrarEquisCirculo;
    int celdasLlenadas;
    bool existeGanador;
    var result = TableroBloc.limpiarTablero(
        mostrarEquisCirculo, celdasLlenadas, existeGanador);
    expect(result, false);
  });

  test('Marcar Casilla Test', () {
    Tablero tablero, mostrarEquisCirculo;
    int indexCelda, celdasLlenadas;
    bool existeBot, existeGanador, existeEmpate;
    Turno turnoJugadorUno;

    var result = TableroBloc.marcarCasilla(
        tablero,
        indexCelda,
        turnoJugadorUno,
        existeBot,
        mostrarEquisCirculo,
        celdasLlenadas,
        existeGanador,
        existeEmpate);
    expect(result, false);
  });
}
