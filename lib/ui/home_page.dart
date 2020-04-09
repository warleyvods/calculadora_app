import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String saida = "0";
  String _saida = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operacao = "";

  buttonPressed(String buttonText) {

    print("Botao: " + buttonText);

    if (buttonText == "AC") {

      saida = "0";
      _saida = "0";
      num1 = 0.0;
      num2 = 0.0;
       operacao = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      num1 = double.parse(saida);
      operacao = buttonText;
      _saida = "0";
    } else if (buttonText == ".") {
      if (_saida.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _saida = _saida + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(saida);

      if (operacao == "+") {
        _saida = (num1 + num2).toString();
      }
      if (operacao == "-") {
        _saida = (num1 - num2).toString();
      }
      if (operacao == "X") {
        _saida = (num1 * num2).toString();
      }
      if (operacao == "/") {
        _saida = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operacao = "";
    } else {
      _saida = _saida + buttonText;
    }

    print(_saida);

    double resultado = double.parse(_saida);

    bool isInteger(num resultado) =>
        resultado is int || resultado == resultado.roundToDouble();

    setState(() {
      if(isInteger(resultado)) {
        saida = double.parse(_saida).toStringAsFixed(0);
      } else {
        saida = double.parse(_saida).toStringAsFixed(1);
      }
    });


  }

  Widget construirBotao(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(saida,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            new Expanded(child: new Divider()),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    construirBotao("7"),
                    construirBotao("8"),
                    construirBotao("9"),
                    construirBotao("/"),
                  ],
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    construirBotao("4"),
                    construirBotao("5"),
                    construirBotao("6"),
                    construirBotao("X"),
                  ],
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    construirBotao("1"),
                    construirBotao("2"),
                    construirBotao("3"),
                    construirBotao("-"),
                  ],
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    construirBotao("."),
                    construirBotao("0"),
                    construirBotao("00"),
                    construirBotao("+"),
                  ],
                )
              ],
            ),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    construirBotao("AC"),
                    construirBotao("="),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
