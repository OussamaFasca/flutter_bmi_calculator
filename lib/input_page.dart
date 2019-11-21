import 'package:flutter/material.dart';
import 'reusable-container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender-creator.dart';
import 'constants-design.dart';
import 'results-page.dart';
import 'calculator-brain.dart';

const activeCard = Color(0xFF393939);
const inactiveCard = Color(0xFF282828);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCard = inactiveCard;
  Color femaleCard = inactiveCard;

  void changeColor(bool gender) {
    if (gender) {
      maleCard = activeCard;
      femaleCard = inactiveCard;
    } else {
      femaleCard = activeCard;
      maleCard = inactiveCard;
    }
  }

  int longueur = 177;
  int weight = 79;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeColor(true);
                        });
                      }, // true = male
                      child: ReusableContainer(
                        couleur: maleCard,
                        cardChild: GenderCreator(
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeColor(false);
                        });
                      }, // false = female
                      child: ReusableContainer(
                        couleur: femaleCard,
                        cardChild: GenderCreator(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ReusableContainer(
                couleur: activeCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: textDesign,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          "$longueur",
                          style: boldDesign,
                        ),
                        Text(
                          "cm",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                        thumbColor: Colors.tealAccent,
                        activeTrackColor: Colors.white,
                        overlayColor: Colors.teal,
                        inactiveTrackColor: inactiveCard,
                      ),
                      child: Slider(
                        value: longueur.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            longueur = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ReusableContainer(
                      couleur: activeCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: textDesign,
                          ),
                          Text(
                            "$weight",
                            style: boldDesign,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MyRoundedButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyRoundedButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ReusableContainer(
                      couleur: activeCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: textDesign,
                          ),
                          Text(
                            "$age",
                            style: boldDesign,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MyRoundedButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyRoundedButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                CalculatorBrain calculatorBrain = CalculatorBrain(longueur,weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calculatorBrain.calculateBMI(),
                      interpretation: calculatorBrain.getInterpretation(),
                      resultText: calculatorBrain.getResult(),
                    )));
              },
              child: Container(
                child: Text(
                  "CALCULATE",
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
      )),
    );
  }
}

class MyRoundedButton extends StatelessWidget {
  MyRoundedButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white30,
      elevation: 5,
    );
  }
}
