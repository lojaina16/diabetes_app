class UserInfo {
  static const String collectionName = "info";
  String? age;
  String? gender;
  String? id;
  String? weight;
  String? hypertension;
  String? heartDisease;
  String? smokingHistory;
  String? bmi;
  String? a1cTest;
  String? bloodGlucoseLevel;

  UserInfo({
    required this.age,
    required this.gender,
    this.id = "",
    required this.weight,
    required this.hypertension,
    required this.smokingHistory,
    required this.bmi,
    required this.a1cTest,
    required this.bloodGlucoseLevel,
    required this.heartDisease,
  });

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "gender": gender,
      "age": age,
      "weight": weight,
      "hypertension": hypertension,
      "heartDisease": heartDisease,
      "smokingHistory": smokingHistory,
      "bmi": bmi,
      "a1cTest": a1cTest,
      "bloodGlucoseLevel": bloodGlucoseLevel
    };
  }

  UserInfo.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data["id"] as String,
            gender: data["gender"],
            age: data["age"],
            weight: data["weight"],
            hypertension: data["hypertension"],
            heartDisease: data["heartDisease"],
            smokingHistory: data["smokingHistory"],
            bmi: data["bmi"],
            a1cTest: data["a1cTest"],
            bloodGlucoseLevel: data["bloodGlucoseLevel"]);
}
