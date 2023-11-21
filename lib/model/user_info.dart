class UserInfo {
  static const String collectionName = "info";
  String? age;
  String? gender;
  String? id;
  String? weight;

  UserInfo(
      {required this.age,
      required this.gender,
      this.id = "",
      required this.weight});

  Map<String, dynamic> toFireStore() {
    return {"id": id, "gender": gender, "age": age, "weight": weight};
  }

  UserInfo.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data["id"] as String,
            gender: data["gender"],
            age: data["age"],
            weight: data["weight"]);
}
