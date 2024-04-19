class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uid;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uid: json['uid']);

  toMap() => {"name": name, "email": email, "phone": phone, "uid": uid};
}
