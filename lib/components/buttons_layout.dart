import 'package:flutter/material.dart';
import 'package:ftimer/utils/constants.dart';
import 'package:ftimer/utils/styles.dart';

class ButtonsLayout extends StatelessWidget {
  Function onPressedReset;
  Function onPressedStart;

  ButtonsLayout({this.onPressedReset, this.onPressedStart});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _button(onPressedReset, 'Reset'),
          _button(onPressedStart, 'Start'),
        ],
      ),
    );
  }

  Expanded _button(Function onPressed, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Text(
            label,
            style: kCardTitleStyle,
          ),
          color: kButtonColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
