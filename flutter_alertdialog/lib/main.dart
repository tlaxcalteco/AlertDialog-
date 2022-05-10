import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key, key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  bool _alerta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertaDialog"),
      ),
      body: Center(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RaisedButton(
                padding: EdgeInsets.all(15),
                color: Color.fromARGB(255, 243, 33, 68),
                textColor: Colors.white,
                child: Text(
                  "Activar Alerta",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _mostrarAlerta(context);
                }),
            SizedBox(
              height: 50,
            ),
            Text(
              _alerta ? "Alerta Activa" : "Alerta No Activada",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => new AlertDialog(
              title: Text(_alerta ? "Apagar Alerta" : "Alerta"),
              content: Text(_alerta
                  ? "Quieres apagar la alerta"
                  : "Quieres encender la alerta"),
              actions: [
                TextButton(
                  child: Text("NO"),
                  onPressed: () {
                    print("NO");
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("SI"),
                  onPressed: () {
                    print("SI");
                    setState(() {
                      _alerta = !_alerta;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
