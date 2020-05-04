import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final bool visible;
  final String title;
  final Function onTap;
  BottomButton({this.visible, this.onTap,this.title});


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          margin: EdgeInsets.only(top: 4),
          width: double.infinity,
          color: Colors.red.shade800,
          height: kBottomNavigationBarHeight,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
