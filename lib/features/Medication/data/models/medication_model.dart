class MedicationModel {
  final String id;
  final String title;
  final int notifyId;
  final dynamic time;

  MedicationModel(
      {required this.id,
      required this.notifyId,
      required this.title,
      required this.time});
  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
          id: json['id'],
          title: json['title'],
          time: json['time'],
          notifyId: json['notifyId']);

  toMap() => {"id": id, "title": title, "time": time, "notifyId": notifyId};
}
