class CalculatorModel {
  CalculatorModel({
    this.currentValue = 0,
    this.symbol = false,
    this.isOperate = false,
    this.preOperator = '',
    this.isOperated = true,
  });

  // 현재 저장값
  double currentValue;

  // 연산이 끝난 저장된 값
  double? saveValue;

  // 사칙연산 우선순위를 위한 이전값
  double? preValue;
  // 사칙연산 우선순위를 위한 임시값
  double? tempValue;
  // 연산기호가 눌렸는지 여부
  bool symbol;
  // 사칙연산기호인지
  bool isOperate;
  // 사칙연산 우선순위를 위한 이전 연산기호
  String preOperator;
  // 사칙연산 우선순위를 위한 임시 연산기호
  String? tempOperator;
  // 사칙연산 우선순위를 위한 이전 연산여부
  bool isOperated;
}
