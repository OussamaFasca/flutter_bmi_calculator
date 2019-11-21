import 'package:bmi_calculator/constants-design.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'reusable-container.dart';
import 'calculator-brain.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Your Result !",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ReusableContainer(
                  couleur: activeCard,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "${resultText.toUpperCase()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "$bmiResult",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "$interpretation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(
                    "RE-CALCULATE",
                    textAlign: TextAlign.center,
                    style: resultTextDesign,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
