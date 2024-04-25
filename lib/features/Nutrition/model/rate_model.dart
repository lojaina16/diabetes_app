class RateModel {
  final String userId;
  final String rate;

  RateModel({required this.userId, required this.rate});
  factory RateModel.fromJson(Map<String, dynamic> json) =>
      RateModel(userId: json['userId'], rate: json['rate']);
}
