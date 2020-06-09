import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftimer/components/buttons_layout.dart';
import 'package:ftimer/model/timer_data.dart';
import 'package:ftimer/model/timer_item.dart';
import 'package:ftimer/utils/colors.dart';
import 'package:quiver/async.dart';

class Countdown extends StatefulWidget {
  final TimerData timerData;

  Countdown({this.timerData});

  _Countdown createState() => _Countdown();
}

class _Countdown extends State<Countdown> {
  List<TimerItem> timerList;
  int _duration;
  CountdownTimer countDownTimer;
  StreamSubscription<CountdownTimer> cdt;
  String _title = '';
  int _timerIndex;

  @override
  void initState() {
    super.initState();
    _setTimerList();
  }

  _setTimerList() {
    _cancelTimer();
    timerList = List<TimerItem>();
    timerList.add(TimerItem('Ready', 3));
    for (int i = 0; i < widget.timerData.seriesValue; i++) {
      timerList.add(TimerItem('Series ${i + 1}', widget.timerData.durationValue));
      timerList.add(TimerItem('Pause ${i + 1}', widget.timerData.pauseValue));
    }
    timerList.removeLast();
    _timerIndex = 0;

    print(timerList.toString());

    _startTimer();
  }

  _startTimer() {
    TimerItem _timerItem = timerList[_timerIndex];
    print(_timerItem);
    _duration = _timerItem.duration;
    countDownTimer = CountdownTimer(
      Duration(seconds: _timerItem.duration),
      Duration(seconds: 1),
    );
    cdt = countDownTimer.listen(null);
    cdt.onData((data) {
      setState(() {
        _title = _timerItem.title;
        _duration--;
      });
    });
    cdt.onDone(() {
      cdt.cancel();

      _timerIndex++;
      if (_timerIndex < timerList.length) {
        _startTimer();
      } else {
        setState(() {
          _title = 'Done';
        });
      }
    });
  }

  _cancelTimer() {
    if (cdt != null) {
      cdt.cancel();
    }
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                _title,
                style: TextStyle(
                  fontSize: 36.0,
                  color: kCardValueColor,
                ),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: AutoSizeText(
                    _duration.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 600.0,
                      color: _duration > 5 ? kCountdownNormalColor : kCountdownAlertColor,
                    ),
                    maxLines: 1,
                    minFontSize: 100.0,
                  ),
                ),
              ),
              ButtonsLayout(
                labelLeft: 'Restart',
                onPressedLeft: () {
                  setState(
                    () {
                      _setTimerList();
                    },
                  );
                },
                labelRight: 'Cancel',
                onPressedRight: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//RaisedButton(
//elevation: 8.0,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(8.0),
//),
//padding: EdgeInsets.all(16.0),
//child: Text(
//"Cancel",
//style: kCardTitleStyle,
//),
//color: kButtonColor,
//onPressed: () {
//Navigator.pop(context);
//},
//),

//return SafeArea(
//child: Scaffold(
//body: Container(
//margin: EdgeInsets.all(12.0),
//child: Column(
//children: <Widget>[
//Expanded(
//child: Center(
//child: AutoSizeText(
//43.toString(),
//style: TextStyle(
//fontSize: 600.0,
//color: kCardValueColor,
//),
//maxLines: 1,
//minFontSize: 100.0,
//),
//),
//),
//RaisedButton(
//elevation: 8.0,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(8.0),
//),
//padding: EdgeInsets.all(16.0),
//child: Text(
//"Cancel",
//style: kCardTitleStyle,
//),
//color: kButtonColor,
//onPressed: () {
//Navigator.pop(context);
//},
//),
//],
//),
//),
//),
//);
