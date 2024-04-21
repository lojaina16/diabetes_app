class EmergencyModel {
  final String phone;
  final String id;

  EmergencyModel({required this.phone, required this.id});
  factory EmergencyModel.fromJson(Map<String, dynamic> json) =>
      EmergencyModel(phone: json['phone'], id: json['id']);
  toMap() => {"phone": phone, "id": id};
}
