import 'package:flutter/material.dart';
import 'package:ftimer/screens/ftimer_selector.dart';

void main() => runApp(FtimerApp());

class FtimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFF555555),
      ),
      home: FTimerSelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
