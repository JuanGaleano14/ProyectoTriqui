import 'package:flutter_app_prueba/src/models/tablero_model.dart';

class TableroBloc {

  static bool validarGanador(Tablero tablero) {
    bool ganador;
    // checks 1st row
    if (tablero.celdas[0] == tablero.celdas[1] &&
        tablero.celdas[0] == tablero.celdas[2] &&
        tablero.celdas[0] != '') {
      ganador = confirmarGanador(tablero.celdas[0]);
    }

    // checks 2nd row
    if (tablero.celdas[3] == tablero.celdas[4] &&
        tablero.celdas[3] == tablero.celdas[5] &&
        tablero.celdas[3] != '') {
      ganador = confirmarGanador(tablero.celdas[3]);
    }

    // checks 3rd row
    if (tablero.celdas[6] == tablero.celdas[7] &&
        tablero.celdas[6] == tablero.celdas[8] &&
        tablero.celdas[6] != '') {
      ganador = confirmarGanador(tablero.celdas[6]);
    }

    // checks 1st column
    if (tablero.celdas[0] == tablero.celdas[3] &&
        tablero.celdas[0] == tablero.celdas[6] &&
        tablero.celdas[0] != '') {
      ganador = confirmarGanador(tablero.celdas[0]);
    }

    // checks 2nd column
    if (tablero.celdas[1] == tablero.celdas[4] &&
        tablero.celdas[1] == tablero.celdas[7] &&
        tablero.celdas[1] != '') {
      ganador = confirmarGanador(tablero.celdas[1]);
    }

    // checks 3rd column
    if (tablero.celdas[2] == tablero.celdas[5] &&
        tablero.celdas[2] == tablero.celdas[8] &&
        tablero.celdas[2] != '') {
      ganador = confirmarGanador(tablero.celdas[2]);
    }

    // checks diagonal der to izq
    if (tablero.celdas[6] == tablero.celdas[4] &&
        tablero.celdas[6] == tablero.celdas[2] &&
        tablero.celdas[6] != '') {
      ganador = confirmarGanador(tablero.celdas[6]);
    }

    // checks diagonal izq to der
    if (tablero.celdas[0] == tablero.celdas[4] &&
        tablero.celdas[0] == tablero.celdas[8] &&
        tablero.celdas[0] != '') {
      ganador = confirmarGanador(tablero.celdas[0]);
    }

    return ganador;
  }

  static bool confirmarGanador(String figuraGanador) {
    bool ganador;
    if (figuraGanador == 'O' || figuraGanador == 'X') {
      ganador = true;
    } else {
      ganador = false;
    }
    return ganador;
  }
}
