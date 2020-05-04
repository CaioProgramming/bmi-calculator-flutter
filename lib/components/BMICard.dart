import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BMICard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onTap;
  BMICard({@required this.color, @required this.cardChild,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)),
        height: 200,
        child: cardChild,
      ),
    );
  }


}
