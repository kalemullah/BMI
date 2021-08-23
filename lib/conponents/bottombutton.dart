import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({this.ontap,this.BottonTitle});
  final Function ontap;
  final String BottonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        child: Center(
          child: Text(
            BottonTitle,
            style:KLargButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: KBottomContainerColor,
        height: KBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}