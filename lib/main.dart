import 'package:flutter/material.dart';
import 'package:ftimer/screens/ftimer_selector.dart';
import 'package:ftimer/utils/constants.dart';

void main() => runApp(FtimerApp());

class FtimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: kSelectorBackgroundColor),
      home: FTimerSelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
