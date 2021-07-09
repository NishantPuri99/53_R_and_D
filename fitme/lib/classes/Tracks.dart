// @dart=2.9
final String tableTracks = 'Tracks';

class TrackFields {
  static final List<String> values = [id, info];
  static final String id = '_id';
  static final String info = 'info';
}

class Track {
  final int id;
  final String info;

  const Track({this.id, this.info});

  Track copy({
    int id,
    String info,
  }) =>
      Track(
        id: id ?? this.id,
        info: info ?? this.info,
      );

  static Track fromJson(Map<String, Object> json) => Track(
        id: json[TrackFields.id] as int,
        info: json[TrackFields.info] as String,
      );

  Map<String, Object> toJson() => {
        TrackFields.id: id,
        TrackFields.info: info,
      };
}
