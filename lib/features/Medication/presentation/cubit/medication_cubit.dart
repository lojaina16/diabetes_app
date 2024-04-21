import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/features/Medication/data/models/medication_model.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:uuid/uuid.dart';

part 'medication_state.dart';

class MedicationCubit extends Cubit<MedicationState> {
  MedicationCubit() : super(MedicationInitial());
  static MedicationCubit get(context) => BlocProvider.of(context);
  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final SwipeActionController swipeActionController = SwipeActionController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final List<MedicationModel> med = [];

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveNotificationResponse,
    );
  }

  NotificationDetails notificationDetails = const NotificationDetails(
      android:
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              // sound: RawResourceAndroidNotificationSound('notification'),
              playSound: true,
              ticker: 'ticker'));

  DateTime scheduled = DateTime.now();
  bool schedule = false;
  void selectReminder(reminder) {
    emit(MedicationInitial());
    scheduled = reminder;
    schedule = true;
    emit(MedicationAddReminder());
  }

  Future showNotifyByTime(
      {required String title,
      required String body,
      required DateTime scheduled,
      String? payload,
      int id = 0}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(scheduled, tz.local), notificationDetails,
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future getReminder() async {
    emit(MedicationLoading());
    try {
      final coll = await firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("MedicationS")
          .get();
      if (coll.docs.isNotEmpty) {
        med.clear();
        for (var element in coll.docs) {
          med.add(MedicationModel.fromJson(element.data()));
        }
      }

      emit(MedicationGetReminderSuccessfully());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
      emit(MedicationGetReminderError());
    }
  }

  Future addReminder() async {
    emit(MedicationLoading());
    try {
      final String id = const Uuid().v4();
      final model =
          MedicationModel(id: id, time: scheduled, title: controller.text);
      firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("MedicationS")
          .doc(id)
          .set(model.toMap());
      showNotifyByTime(
        title: 'MedicationS',
        body: model.title,
        scheduled: scheduled,
      );
      getReminder();
      emit(MedicationAddReminderSuccessfully());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
      emit(MedicationAddReminderError());
    }
  }
}
