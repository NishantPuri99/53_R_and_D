//@dart=2.9
final String tableUser = 'User';

class UserFields {
  static final List<String> values = [
    id,
    name,
    email,
    height,
    weight,
    meditation,
    physical,
    targetWeight,
    score,
    totalScore,
    achievementsList,
  ];
  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String height = 'height';
  static final String weight = 'weight';
  static final String meditation = 'meditation';
  static final String physical = 'physical';
  static final String targetWeight = 'target weight';
  static final String score = 'score';
  static final String totalScore = 'total score';
  static final String achievementsList = 'achievements list';
}

class User {
  final int id;
  final String name;
  final String email;
  final int height;
  final int weight;
  final bool meditation;
  final bool physical;
  final int targetWeight;
  final int score;
  final int totalScore;
  final String achievementList;

  const User({
    this.id,
    this.name,
    this.email,
    this.height,
    this.weight,
    this.meditation,
    this.physical,
    this.targetWeight,
    this.score,
    this.totalScore,
    this.achievementList,
  });

  User copy({
    int id,
    String name,
    String email,
    int height,
    int weight,
    bool meditation,
    bool physical,
    int targetWeight,
    int score,
    int totalScore,
    String achievementsList,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        meditation: meditation ?? this.meditation,
        physical: physical ?? this.physical,
        targetWeight: targetWeight ?? this.targetWeight,
        score: score ?? this.score,
        totalScore: totalScore ?? this.totalScore,
        achievementList: achievementList ?? this.achievementList,
      );

  static User fromJson(Map<String, Object> json) => User(
        id: json[UserFields.id] as int,
        name: json[UserFields.name] as String,
        email: json[UserFields.email] as String,
        height: json[UserFields.height] as int,
        weight: json[UserFields.weight] as int,
        meditation: json[UserFields.meditation] as bool,
        physical: json[UserFields.physical] as bool,
        targetWeight: json[UserFields.targetWeight] as int,
        score: json[UserFields.score] as int,
        totalScore: json[UserFields.totalScore] as int,
        achievementList: json[UserFields.achievementsList] as String,
      );

  Map<String, Object> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.height: height,
        UserFields.weight: weight,
        UserFields.meditation: meditation ? 1 : 0,
        UserFields.physical: physical ? 1 : 0,
        UserFields.targetWeight: targetWeight,
        UserFields.score: score,
        UserFields.totalScore: totalScore,
        UserFields.achievementsList: achievementList,
      };
}
