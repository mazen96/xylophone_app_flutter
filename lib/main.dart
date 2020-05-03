import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  Color changeColor() {
    final Color newColor = UniqueColorGenerator.getColor();
    return newColor;
  }

  void playSound(int noteNum) {
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }

  List<Widget> createXylophone() {
    List<Widget> widgetList = [];
    for (int i = 0; i < 7; i++) {
      Color randColor = changeColor();
      Widget newButton = createButton(i + 1, randColor);
      widgetList.add(newButton);
    }
    return widgetList;
  }

  Widget createButton(int noteNum, Color buttonColor) {
    Widget newButton = Expanded(
      child: FlatButton(
        color: buttonColor,
        onPressed: () {
          playSound(noteNum);
        },
      ),
    );

    return newButton;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: createXylophone(),
    );
  }
}

class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
