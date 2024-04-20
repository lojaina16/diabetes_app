

class MyUserInfo {
  final String age;
  final String gender;
  final String id;
  final String weight;
  final String hypertension;
  final String heartDisease;
  final String smokingHistory;
  final String bmi;
  final String a1cTest;
  final String bloodGlucoseLevel;
  final String type;

  MyUserInfo({
    required this.age,
    required this.gender,
    required this.id,
    required this.weight,
    required this.hypertension,
    required this.smokingHistory,
    required this.bmi,
    required this.type,
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
      "type": type,
      "heartDisease": heartDisease,
      "smokingHistory": smokingHistory,
      "bmi": bmi,
      "a1cTest": a1cTest,
      "bloodGlucoseLevel": bloodGlucoseLevel
    };
  }

  MyUserInfo.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data["id"],
            type: data['type'],
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
