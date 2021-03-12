import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_prueba/src/models/tablero_model.dart';
import 'package:flutter_app_prueba/src/view/tablero/tableroview.dart';
import '../models/turno_model.dart';

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

  static bool limpiarTablero(
      Tablero mostrarEquisCirculo, int celdasLlenadas, bool existeGanador) {
    //De acuerdo al cambio de estado se re construye el build.
    for (var i = 0; i < 9; i++) {
      mostrarEquisCirculo.celdas[i] = '';
    }

    celdasLlenadas = 0;
    existeGanador = false;
  }

  static bool marcarCasilla(
      Tablero tablero,
      int indexCelda,
      Turno turnoJugadorUno,
      bool existeBot,
      Tablero mostrarEquisCirculo,
      int celdasLlenadas,
      bool existeGanador,
      bool existeEmpate) {
    //Se tiene en cuenta el estado del _MyHomePageState

    //Si es el turno del jugador y la casilla está vacía
    if (turnoJugadorUno.estado &&
        existeBot &&
        mostrarEquisCirculo.celdas[indexCelda] == '') {
      mostrarEquisCirculo.celdas[indexCelda] = 'O';
      //Aumenta contador de celdas ocupadas
      celdasLlenadas += 1;
      validarGanador(mostrarEquisCirculo);
      bot(mostrarEquisCirculo, existeBot, celdasLlenadas, turnoJugadorUno);
    } else if (turnoJugadorUno.estado &&
        mostrarEquisCirculo.celdas[indexCelda] == '') {
      mostrarEquisCirculo.celdas[indexCelda] = 'O';
      //Aumenta contador de celdas ocupadas
      celdasLlenadas += 1;
      //Verificar si hay un ganador
      validarGanador(mostrarEquisCirculo);
    } else if (!turnoJugadorUno.estado &&
        mostrarEquisCirculo.celdas[indexCelda] == '') {
      mostrarEquisCirculo.celdas[indexCelda] = 'X';
      //Aumenta contador de celdas ocupadas
      celdasLlenadas += 1;
      //Verificar si hay un ganador
      validarGanador(mostrarEquisCirculo);
    }

    //Cambia el turno
    if (existeBot && (existeGanador || existeEmpate)) {
      turnoJugadorUno.estado = true;
    } else {
      turnoJugadorUno.estado = !turnoJugadorUno.estado;
    }
  }

  static void bot(Tablero mostrarEquisCirculo, bool existeGanador,
      int celdasLlenadas, Turno turnoJugadorUno) {
    var move = Random().nextInt(9);
    var isPlayed = false;
    while (!isPlayed) {
      if (mostrarEquisCirculo.celdas[move] == '' &&
          mostrarEquisCirculo.celdas[move] != 'X' &&
          existeGanador == false) {
        mostrarEquisCirculo.celdas[move] = 'X';
        celdasLlenadas += 1;
        validarGanador(mostrarEquisCirculo);
        //Cambia el turno existeBot
        turnoJugadorUno.estado = !turnoJugadorUno.estado;
        isPlayed = true;
      } else if (celdasLlenadas == 9 || existeGanador) {
        isPlayed = true;
      } else {
        move = Random().nextInt(9);
      }
    }
  }
}
