import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ftimer/const/constants.dart';
import 'package:ftimer/const/styles.dart';

class CardWidget extends StatefulWidget {
  CardWidget({@required this.cardTitle, @required this.maxValue});

  final String cardTitle;
  final double maxValue;
  double value = 0.0;

  @override
  _CardWidget createState() => _CardWidget();
}

class _CardWidget extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        margin: EdgeInsets.only(
          top: 8.0,
          left: 12.0,
          right: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kCardBackColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.cardTitle.toUpperCase(),
              style: kCardTitleStyle,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: widget.value,
                        min: 0.0,
                        max: widget.maxValue,
                        onChanged: (double newValue) {
                          setState(() {
                            widget.value = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        widget.value.round().toString(),
                        style: kCardValueTextStyle,
                        maxLines: 1,
                        minFontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
