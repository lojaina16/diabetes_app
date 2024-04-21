import 'package:diabetes/core/extensions/dialog_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Emergency/data/models/emergency_model.dart';
import 'package:diabetes/features/Emergency/presentation/cubit/emergency_cubit.dart';
import 'package:diabetes/features/Emergency/presentation/widgets/emergency_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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

class EmergencyItem extends StatelessWidget {
  final EmergencyModel item;
  final EmergencyCubit cubit;
  const EmergencyItem({
    super.key,
    required this.item,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final phoneNumber = Uri.parse('tel:+20 ${item.phone}');
        if (await canLaunchUrl(phoneNumber)) {
          await launchUrl(phoneNumber);
        } else {
          context.showSnack('Could not launch $phoneNumber', isError: true);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
        child: Row(
          children: [
            Icon(
              Icons.phone,
              color: AppColors.error,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.phone,
                style: TextStyle(
                    color: AppColors.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                cubit.delete(item.id);
              },
              child: Icon(
                Icons.delete,
                color: AppColors.error,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
