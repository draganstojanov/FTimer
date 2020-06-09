import 'package:flutter/material.dart';
import 'package:ftimer/utils/colors.dart';
import 'package:ftimer/utils/styles.dart';

class ButtonsLayout extends StatelessWidget {
  final Function onPressedLeft;
  final Function onPressedRight;
  final String labelLeft;
  final String labelRight;

  const ButtonsLayout({Key key, this.onPressedLeft, this.onPressedRight, this.labelLeft, this.labelRight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _button(onPressedLeft, labelLeft),
          _button(onPressedRight, labelRight),
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
