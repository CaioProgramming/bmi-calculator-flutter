import 'package:bmi_calculator/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent(this.icon, this.label,this.iconcolor);
  final Color iconcolor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 80,color: iconcolor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label.toUpperCase(),
              style: Helper().labelTextStyle(iconcolor),
            ),
          )
        ],
      ),
    );
  }
}
