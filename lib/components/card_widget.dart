import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ftimer/utils/colors.dart';
import 'package:ftimer/utils/styles.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {@required this.cardTitle,
      @required this.slider,
      @required this.valueTxt});

  final String cardTitle;
  final Slider slider;
  final AutoSizeText valueTxt;

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
              cardTitle.toUpperCase(),
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
                        child: slider),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight, child: valueTxt),
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
