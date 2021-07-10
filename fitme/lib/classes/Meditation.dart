//@dart=2.9
final String tableMeditation = 'Meditation';

class MeditationFields {
  static final List<String> values = [
    id,
    time,
    activityID,
    target,
    date,
  ];
  static final String id = '_id';
  static final String time = 'time';
  static final String activityID = 'activityID';
  static final String target = 'target';
  static final String date = 'date';
}

class Meditation {
  final int id;
  final String time;
  final int activityID;
  final int target;
  final DateTime date;

  const Meditation({
    this.id,
    this.time,
    this.activityID,
    this.target,
    this.date,
  });

  Meditation copy({
    int id,
    String time,
    int activityID,
    int target,
    DateTime date,
  }) =>
      Meditation(
        id: id ?? this.id,
        time: time ?? this.time,
        activityID: activityID ?? this.activityID,
        target: target ?? this.target,
        date: date ?? this.date,
      );

  static Meditation fromJson(Map<String, Object> json) => Meditation(
        id: json[MeditationFields.id] as int,
        time: json[MeditationFields.time] as String,
        activityID: json[MeditationFields.activityID] as int,
        target: json[MeditationFields.target] as int,
        date: json[MeditationFields.date] as DateTime,
      );

  Map<String, Object> toJson() => {
        MeditationFields.id: id,
        MeditationFields.target: time,
        MeditationFields.activityID: activityID,
        MeditationFields.target: target,
        MeditationFields.date: date.toIso8601String(),
      };
}
