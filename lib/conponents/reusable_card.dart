import 'package:flutter/material.dart';

class Reuseblecard extends StatelessWidget {
  Reuseblecard({@required this.colour, this.CardChild, this.onpress});

  final Widget CardChild;
  final Color colour;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
