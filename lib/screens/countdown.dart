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
  List<TimerItem> _timerList;
  int _duration;
  CountdownTimer _countDownTimer;
  StreamSubscription<CountdownTimer> _cdt;
  String _title = '';
  int _timerIndex;

  @override
  initState() {
    super.initState();
    _setTimerList();
  }

  _setTimerList() {
    _cancelTimer();
    _timerList = List<TimerItem>();
    _timerList.add(TimerItem('Ready', 3));
    for (int i = 0; i < widget.timerData.seriesValue; i++) {
      _timerList.add(TimerItem('Series ${i + 1}', widget.timerData.durationValue));
      _timerList.add(TimerItem('Pause ${i + 1}', widget.timerData.pauseValue));
    }
    _timerList.removeLast();
    _timerIndex = 0;

    print(_timerList.toString());

    _startTimer();
  }

  _startTimer() {
    TimerItem _timerItem = _timerList[_timerIndex];
    setState(() {
      _title = _timerItem.title;
    });
    _duration = _timerItem.duration;
    _countDownTimer = CountdownTimer(
      Duration(seconds: _timerItem.duration),
      Duration(seconds: 1),
    );
    _cdt = _countDownTimer.listen(null);
    _cdt.onData((data) {
      setState(() {
        _duration--;
      });
    });
    _cdt.onDone(() {
      _cdt.cancel();

      _timerIndex++;
      if (_timerIndex < _timerList.length) {
        _startTimer();
      } else {
        setState(() {
          _title = 'Done';
        });
      }
    });
  }

  _cancelTimer() {
    if (_cdt != null) {
      _cdt.cancel();
    }
  }

  @override
  dispose() {
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
