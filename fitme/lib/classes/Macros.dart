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
    date
  ];
  static final String id = '_id';
  static final String itemName = 'itemName';
  static final String calories = 'calories';
  static final String protein = 'protein';
  static final String carbohydrates = 'carbohydrates';
  static final String fats = 'fats';
  static final String date = 'date';
}

class Macro {
  final int id;
  final String itemName;
  final int calories;
  final int protein;
  final int carbohydrates;
  final int fats;
  final DateTime date;

  const Macro({
    this.id,
    this.itemName,
    this.calories,
    this.protein,
    this.carbohydrates,
    this.fats,
    this.date,
  });

  Macro copy({
    int id,
    String itemName,
    int calories,
    int protein,
    int carbohydrates,
    int fats,
    DateTime date,
  }) =>
      Macro(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fats: fats ?? this.fats,
        date: date ?? this.date,
      );

  static Macro fromJson(Map<String, Object> json) => Macro(
        id: json[MacroFields.id] as int,
        itemName: json[MacroFields.itemName] as String,
        calories: json[MacroFields.calories] as int,
        protein: json[MacroFields.protein] as int,
        carbohydrates: json[MacroFields.carbohydrates] as int,
        fats: json[MacroFields.fats] as int,
        date: json[MacroFields.date] as DateTime,
      );

  Map<String, Object> toJson() => {
        MacroFields.id: id,
        MacroFields.itemName: itemName,
        MacroFields.calories: calories,
        MacroFields.protein: protein,
        MacroFields.carbohydrates: carbohydrates,
        MacroFields.fats: fats,
        MacroFields.date: date.toIso8601String(),
      };
}
