import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    super.initState();
  }

  int currentValue = 0;
  String serializeValue = '';
  bool symbol = false;
  bool isOperate = false;
  String preOperator = '';
  String printValue = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: (Text(
                printValue,

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
                      makeNumberBotton("AC", "operator"),
                      makeNumberBotton("+/-", "operator"),
                      makeNumberBotton("%", "operator"),
                      makeNumberBotton("÷", "operator"),
                    ]),
                    Row(children: [
                      makeNumberBotton("7", "number"),
                      makeNumberBotton("8", "number"),
                      makeNumberBotton("9", "number"),
                      makeNumberBotton("x", "operator"),
                    ]),
                    Row(children: [
                      makeNumberBotton("4", "number"),
                      makeNumberBotton("5", "number"),
                      makeNumberBotton("6", "number"),
                      makeNumberBotton("-", "operator"),
                    ]),
                    Row(children: [
                      makeNumberBotton("1", "number"),
                      makeNumberBotton("2", "number"),
                      makeNumberBotton("3", "number"),
                      makeNumberBotton("+", "operator"),
                    ]),
                    Row(children: [
                      makeNumberBotton("0", "number", 2),
                      makeNumberBotton(".", "operator"),
                      makeNumberBotton("=", "operator"),
                    ]),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget makeNumberBotton(String buttonText, buttonType, [int flex = 1]) {
    return Expanded(
        flex: flex,
        child: ButtonTheme(
          height: double.infinity,
          child: OutlinedButton(
            onPressed: () => valueChange(buttonText, buttonType),
            child: Padding(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
          ),
        ));
  }

  void valueChange(buttonText, buttonType) {
    if (buttonType == "operator") {
      print('buttonValue: ${buttonText}, buttonType: ${buttonType}');
      symbol = true;
      switch (buttonText) {
        case "+":
          if (isOperate) {
            // isOperate = !isOperate;
            currentValue = currentValue + int.parse(printValue);
            setState(() {
              printValue = currentValue.toString();
            });
          } else {
            isOperate = !isOperate;
            preOperator = "+";
            currentValue = int.parse(printValue);
          }
          break;
        case "-":
          if (isOperate) {
            // isOperate = !isOperate;
            currentValue = currentValue - int.parse(printValue);
            setState(() {
              printValue = currentValue.toString();
            });
          } else {
            isOperate = !isOperate;
            preOperator = "-";
            currentValue = int.parse(printValue);
          }
          break;
        case "x":
          if (isOperate) {
            // isOperate = !isOperate;
            currentValue = currentValue - int.parse(printValue);
            setState(() {
              preOperator = "*";
              printValue = currentValue.toString();
            });
          } else {
            isOperate = !isOperate;
            preOperator = "*";
            currentValue = int.parse(printValue);
          }
          break;
        case "÷":
          if (isOperate) {
            // isOperate = !isOperate;
            currentValue = currentValue + int.parse(printValue);
            setState(() {
              preOperator = "*";
              printValue = currentValue.toString();
            });
          } else {
            isOperate = !isOperate;
            preOperator = "*";
            currentValue = int.parse(printValue);
          }
          break;
        case "=":
          int result = 0;
          switch (preOperator) {
            case "+":
              result = currentValue + int.parse(printValue);
              break;
          }
          preOperator = "";
          isOperate = false;
          setState(() {
            printValue = result.toString();
          });
          break;
        case "+/-":
          setState(() {
            printValue = (int.parse(printValue) * -1).toString();
          });
          break;
        case "AC":
          serializeValue = "";
          currentValue = 0;
          isOperate = false;
          setState(() {
            printValue = "0";
          });

          break;
        default:
      }
    } else if (buttonType == "number") {
      int value = int.parse(buttonText);
      print('buttonValue: ${buttonText}, buttonType: ${buttonType}');
      if (printValue == "0" && printValue.indexOf(".") == -1) {
        printValue = "";
      }
      serializeValue = serializeValue + buttonText;
      print(serializeValue);
      setState(() {
        if (symbol) {
          print(true);
          printValue = value.toString();
          symbol = false;
        } else {
          print(false);
          printValue += value.toString();
        }
      });
    }
  }

  int operating(operator, a, b) {
    int result = 0;

    switch (operator) {
      case "+":
        break;
      case "-":
        break;
      case "*":
        break;
      case "/":
        break;
      default:
        break;
    }

    return result;
  }
}
