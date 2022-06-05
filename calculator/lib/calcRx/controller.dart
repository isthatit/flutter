import 'package:calculator/calcRx/model.dart';
import 'package:get/get.dart';
import 'calculator.dart';
import 'package:flutter/material.dart';

class Controller extends GetxController {
  final m = CalculatorModel();
  var printValue = '0'.obs;

  double arithmetic(a, b, oper) {
    print("a: ${a}, b: ${b}, oper:${oper}");
    double result = 0;
    switch (oper) {
      case "+":
        result = a + b;
        break;
      case "-":
        result = a - b;
        break;
      case "x":
        result = a * b;
        break;
      case "÷":
        if (a != 0) {
          result = a / b;
        } else {
          throw "not number";
        }
        break;
    }

    return result;
  }

  double operator(a, b, oper) {
    double result = 0;
    switch (oper) {
      case "=":
        m.symbol = true;
        if (m.preOperator != "") {
          result = arithmetic(a, b, m.preOperator);
        } else {
          result = b;
        }
        break;
      case "+/-":
        m.symbol = true;
        result = b * (-1);
        break;
      case "AC":
        printValue.value = "0";
        m.currentValue = 0;
        m.isOperate = false;
        m.isOperated = true;
        m.tempOperator = '';
        m.tempValue = 0;
        m.preOperator = '';
        m.symbol = false;

        result = 0;

        break;
    }
    return result;
  }

  void valueChange(btnTxt, btnType) {
    if (btnType == "arithmetic") {
      // 사칙 연산기호 누름
      m.symbol = true;
      // 이전 연산이 있었는지?
      if (m.isOperate) {
        // 이전 연산이 있고, +- 에 현재가 +-면 연산 진행
        if ((m.preOperator == "+" || m.preOperator == "-") &&
            (btnTxt == "+" || btnTxt == "-")) {
          m.currentValue = arithmetic(
              m.preValue, double.parse(printValue.value), m.preOperator);
          print(
              "m.currentValue: ${m.currentValue}, m.preValue:${m.preValue}, m.preOperator: ${m.preOperator}, printValue.value: ${double.parse(printValue.value)} ");
          printValue.value = m.currentValue.toString();
          m.preValue = m.currentValue;
          m.preOperator = btnTxt;
        }
        // 이전 연산이 있고, +- 에 현재가 x÷면 temp에 값 넣고 속행
        else if ((m.preOperator == "+" || m.preOperator == "-") &&
            (btnTxt == "x" || btnTxt == "÷")) {
          m.tempOperator = m.preOperator;
          m.tempValue = m.preValue;
          m.preOperator = btnTxt;
          m.preValue = double.parse(printValue.value);
          m.isOperated = false;
        }
        // 이전 연산이 있고, x÷ 에 현재가 x÷면 연산 진행
        else if ((m.preOperator == "x" || m.preOperator == "÷") &&
            (btnTxt == "x" || btnTxt == "÷")) {
          m.currentValue = arithmetic(
              m.preValue, double.parse(printValue.value), m.preOperator);
          m.preOperator = btnTxt;
          m.preValue = m.currentValue;

          printValue.value = m.currentValue.toString();
        }
      }
      // 연산이 없었으면 수, 연산기호 저장 후 다음 입력 받음
      else {
        m.isOperate = !m.isOperate;
        m.preOperator = btnTxt;
        print("empty::: m.preoperator: ${m.preOperator}, btnTxt: ${btnTxt}");
        m.preValue = double.parse(printValue.value);
      }
    }
    // 기타 기호 누름
    else if (btnType == "operator") {
      m.currentValue =
          operator(m.preValue, double.parse(printValue.value), btnTxt);
      print("isopera?? ${m.isOperated}");
      if (!m.isOperated) {
        m.currentValue =
            arithmetic(m.tempValue, m.currentValue, m.tempOperator);
      }
      printValue.value = m.currentValue.toString();
    }
    // 번호키 누름
    else if (btnType == "number") {
      double value = double.parse(btnTxt);
      if (printValue == "0" && printValue.indexOf(".") == -1) {
        printValue.value = "";
      }

      if (m.symbol) {
        printValue.value = value.toString();
        m.symbol = false;
      } else {
        printValue.value += value.toString();
      }
    }

    /*
    if (btnType == "arithmetic") {
      m.symbol = true;
      if (m.isOperate) {
        if ((m.preOperator == "+" || m.preOperator == "-") &&
            (btnTxt == "x" || btnTxt == "÷")) {
          m.tempValue = m.currentValue;
          m.tempOperator = m.preOperator;
          m.currentValue = double.parse(printValue.value);
          m.isOperated = false;
        } else {
          m.currentValue = arithmetic(
              m.currentValue, double.parse(printValue.value), btnTxt);

          if (!m.isOperated && btnTxt == "x" || btnTxt == "÷") {
            m.currentValue =
                arithmetic(m.preValue, m.currentValue, m.preOperator);
          } else if (!m.isOperated && btnTxt == "+" || btnTxt == "-") {}
          m.preOperator = btnTxt;

          printValue.value = m.currentValue.toString();
          m.isOperated = true;
        }
      } else {
        m.isOperate = !m.isOperate;
        m.preOperator = btnTxt;
        m.currentValue = double.parse(printValue.value);
      }
    }
    
    else if (btnType == "operator") {
      if (!m.isOperated) {
        m.currentValue = arithmetic(m.preValue, m.currentValue, m.preOperator);
      }
      m.currentValue =
          operator(m.currentValue, double.parse(printValue.value), btnTxt);
      printValue.value = m.currentValue.toString();
    }
   
     else if (btnType == "number") {
      double value = double.parse(btnTxt);
      if (printValue == "0" && printValue.indexOf(".") == -1) {
        printValue.value = "";
      }

      if (m.symbol) {
        printValue.value = value.toString();
        m.symbol = false;
      } else {
        printValue.value += value.toString();
      }
    }
     */
  }

  Widget makeNumberButton(String buttonText, buttonType, [int flex = 1]) {
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
}

class CalculatorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
