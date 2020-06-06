import 'package:flutter/material.dart';
import 'package:ftimer/components/buttons_layout.dart';
import 'package:ftimer/components/card_widget.dart';

class FTimerSelector extends StatefulWidget {
  @override
  _FTimerSelectorState createState() => _FTimerSelectorState();
}

class _FTimerSelectorState extends State<FTimerSelector> {
  // TimerData timerData = TimerData();

  CardWidget seriesCard;
  CardWidget durationCard;
  CardWidget pauseCard;

  @override
  void initState() {
    super.initState();
    //   timerData.reset();
    seriesCard = CardWidget(cardTitle: 'Series', maxValue: 10);
    durationCard = CardWidget(cardTitle: 'Duration', maxValue: 300);
    pauseCard = CardWidget(cardTitle: 'Pause', maxValue: 120);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            seriesCard,
            durationCard,
            pauseCard,
            ButtonsLayout(
              onPressedReset: () {
                print('fffffffffffffff');

                setState(() {
                  seriesCard = CardWidget(cardTitle: 'Series', maxValue: 10);
                  durationCard =
                      CardWidget(cardTitle: 'Duration', maxValue: 300);
                  pauseCard = CardWidget(cardTitle: 'Pause', maxValue: 120);
                });

                //  timerData.reset();
//                seriesCard.resetValue();
//                durationCard.resetValue();
//                pauseCard.resetValue();
              },
              onPressedStart: () {
                startTimer();
              },
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    // print(timerData.toString());

    // print(seriesCard.createState().value);
//    print(durationCard.value);
//    print(pauseCard.value);
  }
}
