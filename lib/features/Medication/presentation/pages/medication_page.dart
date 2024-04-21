import 'package:diabetes/core/extensions/dialog_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:diabetes/features/Medication/presentation/pages/add_med.dart';
import 'package:diabetes/features/Medication/presentation/widgets/celender_widget.dart';
import 'package:diabetes/features/Medication/presentation/widgets/medication_cad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationPage extends StatelessWidget {
  static const route = "MedicationPage/";
  const MedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.dialog(const AddReminder());
        },
        backgroundColor: AppColors.primary,
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          " Medication follow-up",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<MedicationCubit, MedicationState>(
        builder: (context, state) {
          final cubit = MedicationCubit.get(context);
          return Loading(
            loading: state is MedicationLoading,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/medicationFollow.png'))),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                primary: true,
                children: [
                  const MyCalenderWidget(),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      final item = cubit.med[index];
                      return MedicationCard(
                        item: item,
                        swipeActionController: cubit.swipeActionController,
                        index: index,
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.med.length,
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
