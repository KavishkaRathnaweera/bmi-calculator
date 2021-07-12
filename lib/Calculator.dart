import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String CalcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi >= 18.0) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getDescription() {
    if (_bmi >= 25.0) {
      return 'Reduce tour weight';
    } else if (_bmi >= 18.0) {
      return 'Keep it up';
    } else {
      return 'Increase weight';
    }
  }
}
