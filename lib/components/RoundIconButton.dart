import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Color color;
  final Function onClick;
  final Function onLongPress;
  final IconData icon;
  RoundIconButton({this.color, @required this.onClick, this.icon,this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: color,
      onPressed: onClick,
      onLongPress: (){
        print('Executing Long press');
        onLongPress();
      },
    );
  }
}