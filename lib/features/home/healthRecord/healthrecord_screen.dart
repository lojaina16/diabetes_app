import 'package:diabetes/core/extensions/dialog_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/cubit/home_cubit_state.dart';
import 'package:diabetes/features/home/healthRecord/widget/record.dart';
import 'package:diabetes/features/home/healthRecord/widget/update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthRecord extends StatelessWidget {
  const HealthRecord({super.key});

  static const String routeName = "HealthRecordScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff5063BF),
          toolbarHeight: 80,
          elevation: 0,
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Health Record",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            final info = cubit.userInfo;
            return ListView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              primary: true,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text("Condition:${info?.type}"),
                    isThreeLine: true,
                    subtitle: Text("Blood Type: O+  \n"
                        "Weight: ${info?.weight} kg\n"
                        "Gender: ${info?.gender}\n"
                        "Age: ${info?.age}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.dialog(
                          const UpdateDialog(
                            text: 'weight',
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RecordStatus(
                      text: "Blood Sugar Level",
                      value: info?.bloodGlucoseLevel,
                      prefix: "mg/dl",
                      color: AppColors.blue,
                      onTap: () {
                        context.dialog(
                          const UpdateDialog(
                            text: 'bloodGlucoseLevel',
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    RecordStatus(
                      color: AppColors.green,
                      text: "your Target Goal",
                      value: info?.bloodGlucoseLevel,
                      prefix: "mg/dl",
                    ),
                  ],
                ),
                RecordStatus(
                  color: AppColors.yellow,
                  text: "HbA1c Test",
                  value: info?.a1cTest,
                  prefix: "",
                  onTap: () {
                    context.dialog(
                      const UpdateDialog(
                        text: 'a1cTest',
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ));
  }
}

