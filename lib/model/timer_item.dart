class TimerItem {
  String _title;
  int _duration;

  TimerItem(this._title, this._duration);

  int get duration => _duration;

  String get title => _title;

  @override
  String toString() {
    return 'TimerItem{_title: $_title, _duration: $_duration}';
  }
}
