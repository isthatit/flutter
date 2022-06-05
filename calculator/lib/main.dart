import 'package:calculator/getxPrac/view.dart';
import 'package:calculator/rxPrac/personal_card.dart';
import 'screen/calculator_screen.dart';
import 'calcRx/calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: CalculatorScreen());
        // home: PersonalCard());
        // home: CounterApp());
        home: CaculatorView());
  }
}
