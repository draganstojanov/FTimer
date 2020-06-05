import 'package:flutter/material.dart';
import 'package:ftimer/components/card_widget.dart';

class FTimerSelector extends StatefulWidget {
  @override
  _FTimerSelectorState createState() => _FTimerSelectorState();
}

class _FTimerSelectorState extends State<FTimerSelector> {
  CardWidget seriesCard = CardWidget(cardTitle: 'Series', maxValue: 10);
  CardWidget durationCard = CardWidget(cardTitle: 'Duration', maxValue: 300);
  CardWidget pauseCard = CardWidget(cardTitle: 'pause', maxValue: 120);

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
          ],
        ),
      ),
    );
  }
}
