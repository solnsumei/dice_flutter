import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() async {
    int count = 0;
    final max = 6;

    while(count < 10) {
      leftDiceNumber = Random().nextInt(max) + 1;
      rightDiceNumber = Random().nextInt(max) + 1;

      await Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {});
      });

      count++;
    }
  }

  Widget dice({String imageName}) {
    return Expanded(
      child: FlatButton(
        onPressed: rollDice,
        child: Image.asset(imageName),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          dice(
            imageName: 'images/dice$leftDiceNumber.png',
          ),
          dice(
            imageName: 'images/dice$rightDiceNumber.png',
          ),
        ],
      ),
    );
  }
}