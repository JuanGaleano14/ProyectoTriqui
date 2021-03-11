import 'package:flutter/material.dart';
import 'package:flutter_app_prueba/src/models/tablero_model.dart';
import 'package:flutter_app_prueba/src/models/turno_model.dart';
import 'package:flutter_app_prueba/src/view/home/main_home.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Diseño de tablero
class _MyHomePageState extends State<MyHomePage> {
  bool ganador;

  //Jugador Uno es la figura O
  final turnoJugadorUno = Turno(estado: true);

  //Variable para mostrar al tap la figura X/O.
  final mostrarEquisCirculo =
  Tablero(celdas: ['', '', '', '', '', '', '', '', '']);

  var styleTextLabels = TextStyle(color: Colors.white, fontSize: 18);
  int jugador1Score = 0;
  int jugador2Score = 0;
  int celdasLlenadas = 0;

  //Diseño de letras byGoogleFonts
  static var myNewFont = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 1));
  static var myNewFontButton = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.blueAccent, letterSpacing: 1));
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.white, letterSpacing: -3, fontSize: 14));
  static var myNewFontWhiteTablero = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.white, letterSpacing: -3, fontSize: 25));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jugador 1 ( O )",
                          style: myNewFontWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            jugador1Score.toString(),
                            style: myNewFontWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jugador 2 ( X )",
                          style: myNewFontWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            jugador2Score.toString(),
                            style: myNewFontWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4, //Tamaño de tablero
            child: GridView.builder(
                itemCount: 9, //Cantidad de celdas
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3), //Cuadro de celdas 3x3
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _marcarCasilla(index);
                    }, //tap
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          mostrarEquisCirculo.celdas[index],
                          //Celda seleccionada
                          style: myNewFontWhiteTablero, //Formato de las celdas
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('T R I Q U I', style: myNewFontWhite,),
                    SizedBox(height: 60,),
                    //Text('JPGS - AFPE', style: myNewFontWhite,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _marcarCasilla(int indexCelda) {
    //Se tiene en cuenta el estado del _MyHomePageState
    setState(() {
      //Si es el turno del jugador y la casilla está vacía
      if (turnoJugadorUno.estado &&
          mostrarEquisCirculo.celdas[indexCelda] == '') {
        mostrarEquisCirculo.celdas[indexCelda] = 'O';
        //Aumenta contador de celdas ocupadas
        celdasLlenadas += 1;
      } else if (!turnoJugadorUno.estado &&
          mostrarEquisCirculo.celdas[indexCelda] == '') {
        mostrarEquisCirculo.celdas[indexCelda] = 'X';
        //Aumenta contador de celdas ocupadas
        celdasLlenadas += 1;
      }

      //Cambia el turno
      turnoJugadorUno.estado = !turnoJugadorUno.estado;
      //Verificar si hay un ganador
      _validarGanador(mostrarEquisCirculo);
    });
  }

  _validarGanador(Tablero tablero) {
    // checks 1st row
    if (tablero.celdas[0] == tablero.celdas[1] &&
        tablero.celdas[0] == tablero.celdas[2] &&
        tablero.celdas[0] != '') {
      _mostrarVentanaGanador(tablero.celdas[0]);
    }

    // checks 2nd row
    if (tablero.celdas[3] == tablero.celdas[4] &&
        tablero.celdas[3] == tablero.celdas[5] &&
        tablero.celdas[3] != '') {
      _mostrarVentanaGanador(tablero.celdas[3]);
    }

    // checks 3rd row
    if (tablero.celdas[6] == tablero.celdas[7] &&
        tablero.celdas[6] == tablero.celdas[8] &&
        tablero.celdas[6] != '') {
      _mostrarVentanaGanador(tablero.celdas[6]);
    }

    // checks 1st column
    if (tablero.celdas[0] == tablero.celdas[3] &&
        tablero.celdas[0] == tablero.celdas[6] &&
        tablero.celdas[0] != '') {
      _mostrarVentanaGanador(tablero.celdas[0]);
    }

    // checks 2nd column
    if (tablero.celdas[1] == tablero.celdas[4] &&
        tablero.celdas[1] == tablero.celdas[7] &&
        tablero.celdas[1] != '') {
      _mostrarVentanaGanador(tablero.celdas[1]);
    }

    // checks 3rd column
    if (tablero.celdas[2] == tablero.celdas[5] &&
        tablero.celdas[2] == tablero.celdas[8] &&
        tablero.celdas[2] != '') {
      _mostrarVentanaGanador(tablero.celdas[2]);
    }

    // checks diagonal
    if (tablero.celdas[6] == tablero.celdas[4] &&
        tablero.celdas[6] == tablero.celdas[2] &&
        tablero.celdas[6] != '') {
      _mostrarVentanaGanador(tablero.celdas[6]);
    }

    // checks diagonal
    if (tablero.celdas[0] == tablero.celdas[4] &&
        tablero.celdas[0] == tablero.celdas[8] &&
        tablero.celdas[0] != '') {
      _mostrarVentanaGanador(tablero.celdas[0]);
    }

    if (celdasLlenadas == 9) {
      _mostrarVentanaEmpate();
    }
  }

  void _mostrarVentanaGanador(String figuraGanador) {
    String jugadorGanador = figuraGanador == 'O' ? 'Jugador 1' : 'Jugador 2';
    showDialog(
        barrierDismissible: false,
        //Bloquear el tap afuera de la caja de texto emergente.
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('STOP, Ya ha ganado el ' + jugadorGanador),
            titleTextStyle: myNewFont,
            actions: <Widget>[
              FlatButton(
                child: Text('¡Continuar jugando!', style: myNewFontButton),
                onPressed: () {
                  _limpiarTablero();
                  Navigator.of(context).pop(); //Regresar al board view
                },
              ),
              FlatButton(
                child: Text('Salir', style: myNewFontButton),
                onPressed: () {
                  _limpiarTablero();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroScreen()), // Ruta destino
                  );
                },
              )
            ],
          );
        });

    if (jugadorGanador == 'Jugador 1') {
      jugador1Score += 1;
    } else if (jugadorGanador == 'Jugador 2') {
      jugador2Score += 1;
    }
  }

  void _mostrarVentanaEmpate() {
    showDialog(
        barrierDismissible: false,
        //Bloquear el tap afuera de la caja de texto emergente.
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('¡Lastima! ha sido un empate'),
            titleTextStyle: myNewFont,
            actions: <Widget>[
              FlatButton(
                child: Text('¡Continuar jugando!', style: myNewFontButton),
                onPressed: () {
                  _limpiarTablero();
                  Navigator.of(context).pop(); //Regresar al board view
                },
              ),
              FlatButton(
                child: Text('Salir', style: myNewFontButton),
                onPressed: () {
                  _limpiarTablero();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroScreen()), // Ruta destino
                  );
                },
              )
            ],
          );
        });
  }

  void _limpiarTablero() {
    setState(() {
      //De acuerdo al cambio de estado se re construye el build.
      for (int i = 0; i < 9; i++) {
        mostrarEquisCirculo.celdas[i] = '';
      }
    });

    celdasLlenadas = 0;
  }
}