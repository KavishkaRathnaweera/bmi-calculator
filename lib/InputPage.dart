import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ContainerCard.dart';
import 'IconCard.dart';
import 'Constants.dart';
import 'Calculator.dart';
import 'package:bmi_calculator/Results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 180;
  int selectedWeight = 60;
  int selectedAge = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    clr: selectedGender == Gender.Male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    childCard: reusableIconText(
                      name: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    clr: selectedGender == Gender.Female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    childCard: reusableIconText(
                      name: 'MALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableContainerCard(
                clr: kactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          selectedHeight.toString(),
                          style: knumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: kbottomBarColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: selectedHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Colors.blueGrey,
                        onChanged: (double newValue) {
                          setState(() {
                            selectedHeight = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableContainerCard(
                    clr: kactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onClickButton: () {
                                setState(() {
                                  selectedWeight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClickButton: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainerCard(
                    clr: kactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onClickButton: () {
                                setState(() {
                                  selectedAge--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onClickButton: () {
                                setState(() {
                                  selectedAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                Calculator calc =
                    Calculator(height: selectedHeight, weight: selectedWeight);
                print(calc.CalcBMI());
                //Navigator.pushNamed(context, '/result');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                        bmi: calc.CalcBMI(),
                        weightStatus: calc.getStatus(),
                        weightdesc: calc.getDescription()),
                  ),
                );
              },
              child: Container(
                color: kbottomBarColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kbottomBarHeight,
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onClickButton});
  final IconData icon;
  final Function onClickButton;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClickButton,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 1.0,
    );
  }
}
