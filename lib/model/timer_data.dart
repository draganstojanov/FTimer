class TimerData {
  int _seriesValue = 0;
  int _durationValue = 0;
  int _pauseValue = 0;

  TimerData();

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
    seriesValue = 0;
    durationValue = 0;
    pauseValue = 0;
  }

  @override
  String toString() {
    return 'TimerData{_seriesValue: $_seriesValue, _durationValue: $_durationValue, _pauseValue: $_pauseValue}';
  }
}
