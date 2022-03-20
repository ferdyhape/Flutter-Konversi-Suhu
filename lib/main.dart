import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController controllerInput = new TextEditingController();

  void _konversi() {
    setState(() {
      _inputUser = double.parse(controllerInput.text);
      _kelvin = _inputUser + 273.15;
      _reamur = _inputUser * 0.8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: controllerInput,
                decoration:
                    InputDecoration(hintText: 'Masukkan Suhu Dalam celcius'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [Text("Suhu Dalam Reamur")],
                        ),
                        Row(
                          children: [Text(_reamur.toString())],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [Text("Suhu Dalam Kelvin")],
                        ),
                        Row(
                          children: [
                            Text(_kelvin.toString()),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170),
                width: 1000,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _konversi();
                  },
                  child: Text('Konversi Suhu'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
