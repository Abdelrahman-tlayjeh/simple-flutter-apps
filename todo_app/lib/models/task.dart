// ignore_for_file: avoid_init_to_null
String encodeDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

DateTime decodeDate(String date) {
  List<String> dateInfo = date.split("/");
  return DateTime(
    int.parse(dateInfo[2]),
    int.parse(dateInfo[1]),
    int.parse(dateInfo[0]),
  );
}

class Task {
  final String _task;
  bool _isDone = false;
  dynamic _doneDate = null;

  Task(this._task);

  Task.fromMap(Map<String, dynamic> taskMap)
      : _task = taskMap["task"],
        _isDone = taskMap["isDone"],
        _doneDate = taskMap["doneDate"] != null
            ? decodeDate(taskMap["doneDate"])
            : null;

  String get task => _task;
  bool get isDone => _isDone;
  dynamic get doneDate => _doneDate;

  void toggleDoneState() {
    if (_isDone) {
      _isDone = false;
      _doneDate = null;
    } else {
      _isDone = true;
      _doneDate = DateTime.now();
    }
  }

  Map<String, dynamic> toMap() => {
        "task": _task,
        "isDone": _isDone,
        "doneDate": _doneDate != null ? encodeDate(_doneDate) : null,
      };
}
