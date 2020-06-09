import 'package:ftimer/utils/constants.dart';

class TimerData {
  int _seriesValue;
  int _durationValue;
  int _pauseValue;

  TimerData() {
    reset();
  }

  TimerData.tData(double seriesValue, double durationValue, double pauseValue) {
    this._seriesValue = seriesValue.round();
    this._durationValue = durationValue.round();
    this._pauseValue = pauseValue.round();
  }

  int get seriesValue => _seriesValue;

  set seriesValue(int value) {
    _seriesValue = value;
  }

  int get durationValue => _durationValue;

  set durationValue(int value) {
    _durationValue = value;
  }

  int get pauseValue => _pauseValue;

  set pauseValue(int value) {
    _pauseValue = value;
  }

  void reset() {
    seriesValue = kSeriesMinValue.toInt();
    durationValue = kDurationMinValue.toInt();
    pauseValue = kPauseMinValue.toInt();
  }

}
