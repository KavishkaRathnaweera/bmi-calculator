import 'package:flutter/material.dart';

class ReusableContainerCard extends StatelessWidget {
  // const ReusableContainerCard({
  //   Key key,
  // }) : super(key: key);
  ReusableContainerCard({this.clr, this.childCard, this.onPress});
  final Color clr;
  final Widget childCard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: clr,
        ),
      ),
    );
  }
}
