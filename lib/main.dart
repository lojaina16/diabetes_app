import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/app.dart';
import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init;
   UserData.uid = CacheHelper.getData(key: "uid");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(const MyApp());
}
