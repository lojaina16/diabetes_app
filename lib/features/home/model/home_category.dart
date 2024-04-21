import 'package:diabetes/features/Emergency/presentation/pages/emergency_call_screen.dart';
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
        route: EmergencyCall.route,
        text: "Emergency Calls"),
    HomeCategory(
        image: "health", route: HealthRecord.routeName, text: "Health Records"),
    HomeCategory(
        image: "activity",
        route: HealthRecord.routeName,
        text: "Physical Activates"),
    HomeCategory(
        image: "dr", route: EmergencyCall.route, text: "Ask Your Doctor"),
    HomeCategory(
        image: "plan", route: EmergencyCall.route, text: "Nutrition Plan "),
    HomeCategory(
        image: "medication",
        route: EmergencyCall.route,
      text: "Medication Follow-up")
  ];
}
