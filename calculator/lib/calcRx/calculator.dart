import 'package:calculator/calcRx/controller.dart';
import 'package:calculator/calcRx/primary_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calcaulator_button.dart';

class CaculatorView extends StatelessWidget {
  const CaculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    print(c.m.currentValue);

    return Scaffold(
      appBar: AppBar(title: Text("GetX Calculator")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Obx(() => Text(
                    '${c.printValue}',

                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    // textAlign: TextAlign.right
                  )),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            )),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(children: [
                      CCalculatorButton(
                          text: "AC",
                          press: () {
                            c.valueChange("AC", "operator");
                          }),
                      c.makeNumberButton("AC", "operator"),
                      c.makeNumberButton("+/-", "operator"),
                      c.makeNumberButton("%", "operator"),
                      c.makeNumberButton("÷", "arithmetic"),
                    ]),
                    Row(children: [
                      c.makeNumberButton("7", "number"),
                      c.makeNumberButton("8", "number"),
                      c.makeNumberButton("9", "number"),
                      c.makeNumberButton("x", "arithmetic"),
                    ]),
                    Row(children: [
                      c.makeNumberButton("4", "number"),
                      c.makeNumberButton("5", "number"),
                      c.makeNumberButton("6", "number"),
                      c.makeNumberButton("-", "arithmetic"),
                    ]),
                    Row(children: [
                      c.makeNumberButton("1", "number"),
                      c.makeNumberButton("2", "number"),
                      c.makeNumberButton("3", "number"),
                      c.makeNumberButton("+", "arithmetic"),
                    ]),
                    Row(children: [
                      c.makeNumberButton("0", "number", 2),
                      c.makeNumberButton(".", "operator"),
                      c.makeNumberButton("=", "operator"),
                    ]),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
