import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ftimer/components/buttons_layout.dart';
import 'package:ftimer/components/card_widget.dart';
import 'package:ftimer/model/timer_data.dart';
import 'package:ftimer/screens/countdown.dart';
import 'package:ftimer/utils/constants.dart';
import 'package:ftimer/utils/styles.dart';

class FTimerSelector extends StatefulWidget {
  @override
  _FTimerSelectorState createState() => _FTimerSelectorState();
}

class _FTimerSelectorState extends State<FTimerSelector> {
  TimerData timerData;

  @override
  void initState() {
    super.initState();
    timerData = TimerData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardWidget(
              cardTitle: 'Series',
              slider: Slider(
                value: timerData.seriesValue.toDouble(),
                min: kSeriesMinValue,
                max: kSeriesMaxValue,
                onChanged: (double newValue) {
                  setState(
                    () {
                      timerData.seriesValue = newValue.round();
                    },
                  );
                },
              ),
              valueTxt: AutoSizeText(
                timerData.seriesValue.toString(),
                style: kCardValueTextStyle,
                maxLines: 1,
                minFontSize: 30.0,
              ),
            ),
            CardWidget(
              cardTitle: 'Duration',
              slider: Slider(
                value: timerData.durationValue.toDouble(),
                min: kDurationMinValue,
                max: kDurationMaxValue,
                onChanged: (double newValue) {
                  setState(
                    () {
                      timerData.durationValue = newValue.round();
                    },
                  );
                },
              ),
              valueTxt: AutoSizeText(
                timerData.durationValue.toString(),
                style: kCardValueTextStyle,
                maxLines: 1,
                minFontSize: 30.0,
              ),
            ),
            CardWidget(
              cardTitle: 'Pause',
              slider: Slider(
                value: timerData.pauseValue.toDouble(),
                min: kPauseMinValue,
                max: kPauseMaxValue,
                onChanged: (double newValue) {
                  setState(
                    () {
                      timerData.pauseValue = newValue.round();
                    },
                  );
                },
              ),
              valueTxt: AutoSizeText(
                timerData.pauseValue.toString(),
                style: kCardValueTextStyle,
                maxLines: 1,
                minFontSize: 30.0,
              ),
            ),
            ButtonsLayout(
              labelLeft: 'Reset',
              onPressedLeft: () {
                setState(
                  () {
                    timerData.reset();
                  },
                );
              },
              labelRight: 'Start',
              onPressedRight: () {
                startTimer();
              },
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Countdown(timerData: timerData),
      ),
    );
  }
}
