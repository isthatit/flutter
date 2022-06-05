import 'package:flutter/material.dart';

class CCalculatorButton extends StatelessWidget {
  const CCalculatorButton({Key? key, required this.text, required this.press})
      : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      ),
    );
  }
}
