import 'package:diabetes/features/Emergency/presentation/pages/emergency_call_screen.dart';
import 'package:diabetes/features/Medication/presentation/pages/medication_page.dart';
import 'package:diabetes/features/Nutrition/presentation/pages/nutrition_page.dart';
import 'package:diabetes/features/WorkOut/presentation/pages/exercises_page.dart';
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
        route: WorkOut.route,
        text: "Physical Activates"),
    
    HomeCategory(
        image: "plan", route: NutritionPage.route, text: "Nutrition Plan "),
    HomeCategory(
        image: "medication",
        route: MedicationPage.route,
        text: "Medication Follow-up")
  ];
}
