import 'package:diabetes/features/home/emergencyCall_screen.dart';
import 'package:diabetes/features/home/healthRecord/healthrecord_screen.dart';

class HomeCategory {
  final String image;
  final String route;
  final String text;

  const HomeCategory(
      {required this.image, required this.route, required this.text});

  static const List<HomeCategory> category = [
    HomeCategory(
        image: "emergency",
        route: EmergencyCall.routeName,
        text: "Emergency Calls"),
    HomeCategory(
        image: "health", route: HealthRecord.routeName, text: "Health Records"),
    HomeCategory(
        image: "activity",
        route: HealthRecord.routeName,
        text: "Physical Activates"),
    HomeCategory(
        image: "dr", route: EmergencyCall.routeName, text: "Ask Your Doctor"),
    HomeCategory(
        image: "plan", route: EmergencyCall.routeName, text: "Nutrition Plan "),
    HomeCategory(
        image: "medication",
        route: EmergencyCall.routeName,
      text: "Medication Follow-up")
  ];
}
