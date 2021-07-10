//@dart=2.9
final String tableMacro = 'Macro';

class MacroFields {
  static final List<String> values = [
    id,
    itemName,
    calories,
    protein,
    carbohydrates,
    fats,
    day,
    month,
    year
  ];
  static final String id = '_id';
  static final String itemName = 'itemName';
  static final String calories = 'calories';
  static final String protein = 'protein';
  static final String carbohydrates = 'carbohydrates';
  static final String fats = 'fats';
  static final String day = 'day';
  static final String month = 'month';
  static final String year = 'year';
}

class Macro {
  final int id;
  final String itemName;
  final int calories;
  final int protein;
  final int carbohydrates;
  final int fats;
  final int day;
  final int month;
  final int year;

  const Macro(
      {this.id,
      this.itemName,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.fats,
      this.day,
      this.month,
      this.year});

  Macro copy(
          {int id,
          String itemName,
          int calories,
          int protein,
          int carbohydrates,
          int fats,
          int day,
          int month,
          int year}) =>
      Macro(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fats: fats ?? this.fats,
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
      );

  static Macro fromJson(Map<String, Object> json) => Macro(
        id: json[MacroFields.id] as int,
        itemName: json[MacroFields.itemName] as String,
        calories: json[MacroFields.calories] as int,
        protein: json[MacroFields.protein] as int,
        carbohydrates: json[MacroFields.carbohydrates] as int,
        fats: json[MacroFields.fats] as int,
        day: json[MacroFields.day] as int,
      );

  Map<String, Object> toJson() => {
        MacroFields.id: id,
        MacroFields.itemName: itemName,
        MacroFields.calories: calories,
        MacroFields.protein: protein,
        MacroFields.carbohydrates: carbohydrates,
        MacroFields.fats: fats,
        MacroFields.day: day,
        MacroFields.month: month,
        MacroFields.year: year
      };
}
