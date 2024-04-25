class NutritionFacts {
  final String nutrition;
  final String value;

  NutritionFacts({required this.nutrition, required this.value});
  factory NutritionFacts.fromJson(Map<String, dynamic> json) =>
      NutritionFacts(nutrition: json['name'], value: json['value']);
}
