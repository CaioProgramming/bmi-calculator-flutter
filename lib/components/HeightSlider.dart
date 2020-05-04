import 'package:bmi_calculator/utils/ColorHelper.dart';
import 'package:bmi_calculator/utils/Helper.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Person.dart';

class HeightSlider extends StatefulWidget {
  final Person person;
  final Color color;
  HeightSlider(this.person, this.color);

  @override
  _HeightSliderState createState() => _HeightSliderState(person, color);
}

class _HeightSliderState extends State<HeightSlider> {
  final Person person;
  final Color color;

  _HeightSliderState(this.person, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Height'.toUpperCase(),
          style: Helper().labelTextStyle(Colors.white),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              '${person.height != null ? person.height.toInt() : kminimun.toInt()}',
              style: knumberTextStyle,
            ),
            Text(
              'cm',
              style: ksmallTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
              thumbColor: Colors.redAccent,
              overlayColor: Colors.white.withAlpha(25),
              activeTrackColor: Colors.white,
              inactiveTrackColor: ColorHelper().darken(color,20)


          ),
          child: Slider(
              value: person.height != null ? person.height : kminimun,
              min: kminimun,
              max: kmax,
              onChanged: (newvalue) {
                updateHeight(newvalue);
              }) ,
        ),

      ],
    );
  }

  void updateHeight(double newHeight) {
    print('Updating height to $newHeight');
    setState(() {
      person.height = newHeight;
    });
  }
}
