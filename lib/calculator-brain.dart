import 'package:bmi_calculator/calculator-brain.dart';
import 'dart:math';

class CalculatorBrain {

  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain(this.height, this.weight);


  String calculateBMI()
  {
    _bmi = this.weight / pow (this.height * 0.01 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    _bmi = this.weight / pow (this.height * 0.01 , 2);
    if(_bmi >= 25)
      {
        return "Overweight" ;
      }
    else if (_bmi > 18.5)
      {
        return "Normal" ;
      }
    else
      {
        return "underweight" ;
      }
  }

  String getInterpretation()
  {
    _bmi = this.weight / pow (this.height * 0.01 , 2);
    if(_bmi >= 25)
    {
      return "You have a higher than normal weight, start a diet you fat fuck !" ;
    }
    else if (_bmi > 18.5)
    {
      return "You have a normal body weight, you're getting laid tonight" ;
    }
    else
    {
      return "You have a lower than normal weight, eat something skinny bitch" ;
    }
  }

}