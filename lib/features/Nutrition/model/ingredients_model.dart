class IngredientsModel {
  final String image;
  final String name;
  final String ingredients;
  final String quantities;

  IngredientsModel(
      {required this.image,
      required this.name,
      required this.ingredients,
      required this.quantities});
  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      IngredientsModel(
          image: json['image'],
          name: json['name'],
          ingredients: json['Ingredients'],
          quantities: json['quantities']);
}
