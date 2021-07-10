//@dart=2.9
final String tableRunning = 'Running';

class RunningFields {
  static final List<String> values = [
    id,
    time,
    targetDistance,
    distanceCovered,
    date,
  ];
  static final String id = '_id';
  static final String time = 'time';
  static final String targetDistance = 'targetDistance';
  static final String distanceCovered = 'distanceCovered';
  static final String date = 'date';
}

class Running {
  final int id;
  final String time;
  final int targetDistance;
  final int distanceCovered;
  final DateTime date;

  const Running({
    this.id,
    this.time,
    this.targetDistance,
    this.distanceCovered,
    this.date,
  });

  Running copy({
    int id,
    String time,
    int targetDistance,
    int distanceCovered,
    DateTime date,
  }) =>
      Running(
        id: id ?? this.id,
        time: time ?? this.time,
        targetDistance: targetDistance ?? this.targetDistance,
        distanceCovered: distanceCovered ?? this.distanceCovered,
        date: date ?? this.date,
      );

  static Running fromJson(Map<String, Object> json) => Running(
        id: json[RunningFields.id] as int,
        time: json[RunningFields.time] as String,
        targetDistance: json[RunningFields.targetDistance] as int,
        distanceCovered: json[RunningFields.distanceCovered] as int,
        date: json[RunningFields.date] as DateTime,
      );

  Map<String, Object> toJson() => {
        RunningFields.id: id,
        RunningFields.time: time,
        RunningFields.targetDistance: targetDistance,
        RunningFields.distanceCovered: distanceCovered,
        RunningFields.date: date.toIso8601String(),
      };
}
