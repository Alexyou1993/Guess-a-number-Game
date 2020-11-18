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
  final TextEditingController _userInput = TextEditingController();
  // todo: better variable naming, what does this variable do (Ex. message, currentMessage, userInfo)
  String _showText = '';

  // todo: ?????
  void _guessNumberF() {
    final int _userInt = int.parse(_userInput.text);
    if (_guessNumber == int.parse(_userInput.text)) {
      setState(() {
        _showText =
            'You guessed $_userInt . Congrats!!!\nYou want to try again? Go on!';
        _guessNumber = Random().nextInt(100);
      });
    } else if (_guessNumber > int.parse(_userInput.text)) {
      setState(() {
        _showText = 'You guessed $_userInt\nTry a HIGHER number!';
      });
    } else if (_guessNumber < int.parse(_userInput.text)) {
      setState(() {
        _showText = 'You guessed $_userInt\nTry a LOWER number!';
      });
    }
    _userInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        // todo: AppBar has a centerTitle param
        title: const Text(
          'Guess a number Game ',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'I\'m thinking of a number between 1 and 100. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                wordSpacing: 5,
              ),
            ),
          ),
          const Text(
            'It\'s your turn to guess my number!',
          ),
          Text(
            _showText,
            style: const TextStyle(
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
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Select a Number!',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      controller: _userInput,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FlatButton(
                      child: const Text(
                        'Guess',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onPressed: () {
                        _guessNumberF();
                      }), // todo: trailing comma
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
