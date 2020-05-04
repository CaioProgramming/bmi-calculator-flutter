import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/Helper.dart';
import 'RoundIconButton.dart';
import '../utils/constants.dart';

class IncreaseDecreaseCard extends StatelessWidget {
  final Color color;

  IncreaseDecreaseCard(
      {this.color,
        this.label,
        this.initialValue,
        this.increaseClick,
        this.decreaseClick,this.showasInt});

  final String label;
  final bool showasInt;
  final double initialValue;
  final Function increaseClick, decreaseClick;

  bool canSubtract() => initialValue > 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label.toUpperCase(),
          style: Helper().labelTextStyle(Colors.white),
        ),
        Text('${showasInt ? initialValue.round():initialValue}', style: knumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Visibility(
                visible: canSubtract(),
                child: RoundIconButton(
                    color: color,
                    onClick: () {
                      decreaseClick();
                    },
                    onLongPress: (){
                      decreaseClick();
                    },
                    icon: FontAwesomeIcons.minus),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: RoundIconButton(
                  color: color,
                  onClick: () {
                    increaseClick();
                  },
                  onLongPress: () {
                    increaseClick();
                  },
                  icon: FontAwesomeIcons.plus),
            ),
          ],
        )
      ],
    );
  }
}
