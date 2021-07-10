class ItemModel {
  final List<MacroModel> macro;

  ItemModel({this.macro});

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<MacroModel> macroList =
        list.map((i) => MacroModel.fromJson(i)).toList();

    return ItemModel(macro: macroList);
  }
}

class MacroModel {
  final double sugar;
  final double fiber;
  final double servingSize;
  final int sodium;
  final String name;
  final int potassium;
  final double fatSaturated;
  final double fatTotal;
  final double calories;
  final int cholestrol;
  final double protein;
  final double carbohydrates;

  MacroModel(
      {this.sugar,
      this.fiber,
      this.servingSize,
      this.sodium,
      this.name,
      this.potassium,
      this.fatSaturated,
      this.fatTotal,
      this.calories,
      this.cholestrol,
      this.protein,
      this.carbohydrates});

  factory MacroModel.fromJson(Map<String, dynamic> parsedJson) {
    return MacroModel(
        sugar: parsedJson['sugar_g'],
        fiber: parsedJson['fiber_g'],
        servingSize: parsedJson['serving_size_g'],
        sodium: parsedJson['sodium_mg'],
        name: parsedJson['name'],
        potassium: parsedJson['potassium_mg'],
        fatSaturated: parsedJson['fat_saturated_g'],
        fatTotal: parsedJson['fat_total_g'],
        calories: parsedJson['calories'],
        cholestrol: parsedJson['cholestrol_mg'],
        protein: parsedJson['protein_g'],
        carbohydrates: parsedJson['carbohydrates_total_g']);
  }
}
