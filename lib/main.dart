import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatefulWidget {
  @override
  _TutorialHomeState createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  int _guessNumber = Random().nextInt(100);
  int _userInt = 0;
  String _showText = '';

  void _guessNumberF() {
    print(_guessNumber);
    if (_guessNumber == _userInt) {
      setState(() {
        _showText = 'You guessed $_userInt . Congrats!!!';
        _guessNumber = Random().nextInt(100);
      });
    } else if (_guessNumber > _userInt) {
      setState(() {
        _showText = ('You guessed $_userInt.\nTry a HIGHER number!');
      });
    } else if (_guessNumber < _userInt) {
      setState(() {
        _showText = ('You guessed $_userInt.\nTry a LOWER number!');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guess a number Game ',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[],
      ),
      // body is the majority of the screen.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'I\'m thinking of a number between 1 and 100. ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              wordSpacing: 5,
            ),
          ),
          Text('It\'s your turn to guess my number!'),
          Text(
            '$_showText',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              wordSpacing: 5,
            ),
          ),
          Card(
            color: Colors.green,
            elevation: 15,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Select a Number!',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _userInt = int.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FlatButton(
                      child: Text(
                        'Guess',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onPressed: () {
                        _guessNumberF();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
