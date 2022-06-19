import 'package:flutter/material.dart';
import 'package:pomodoro/screen/timer_screen.dart';
import 'package:pomodoro/screen/timer_screen_getx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer App ',
      home: TimerScreenGetx(),
    );
  }
}
