import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ContainerCard.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmi,
      @required this.weightStatus,
      @required this.weightdesc});

  String weightStatus;
  String bmi;
  String weightdesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: ReusableContainerCard(
                clr: kactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        weightStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bmi,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 100.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 35.0,
                    // ),
                    Expanded(
                      child: Text(
                        weightdesc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: kbottomBarColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kbottomBarHeight,
                child: Center(
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
