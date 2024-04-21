import 'package:diabetes/core/extensions/dialog_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Emergency/presentation/cubit/emergency_cubit.dart';
import 'package:diabetes/features/Emergency/presentation/widgets/emergency_dialog.dart';
import 'package:diabetes/features/Emergency/presentation/widgets/emergency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmergencyCall extends StatelessWidget {
  static const route = "EmergencyCall/";
  const EmergencyCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EmergencyCubit, EmergencyState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = EmergencyCubit.get(context);
          return Loading(
            loading: state is EmergencyLoading,
            child: Container(
              height: context.height,
              width: context.width,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/EmergencyBack.png',
                ),
              )),
              child: Stack(
                children: [
                  ListView(
                    primary: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: context.width * 0.15,
                            ),
                            const Center(
                              child: Text(
                                "Emergency call",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: cubit.phones.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = cubit.phones[index];
                          return EmergencyItem(
                            cubit: cubit,
                            item: item,
                          );
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MyButton(
                      text: "Emergency",
                      onTap: () async {
                        final value = await context.dialog(DialogEMergency(
                          controller: cubit.controller,
                        ));
                        if (value != null) {
                          cubit.add(value);
                        }
                      },
                      buttonColor: AppColors.error,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

