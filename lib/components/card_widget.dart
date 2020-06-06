import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ftimer/utils/constants.dart';
import 'package:ftimer/utils/styles.dart';

class CardWidget extends StatefulWidget {
  CardWidget({@required this.cardTitle, @required this.maxValue});

  final String cardTitle;
  final double maxValue;
  final double value = 0.0;
  @override
  _CardWidget createState() => _CardWidget();
}

class _CardWidget extends State<CardWidget> {
  double value=0.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        margin: EdgeInsets.only(
          top: 12.0,
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
                        trackHeight: 8.0,
                        inactiveTrackColor: kCardTitleColor,
                        activeTrackColor: kCardTitleColor,
                        thumbColor: kCardValueColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      ),
                      child: Slider(
                        value: value,
                        min: 0.0,
                        max: widget.maxValue,
                        onChanged: (double newValue) {
                          setState(() {
                            value = newValue;
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
                        value.round().toString(),
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
