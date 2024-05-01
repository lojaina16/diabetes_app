import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Emergency/data/models/emergency_model.dart';
import 'package:diabetes/features/Emergency/presentation/cubit/emergency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
          // ignore: use_build_context_synchronously
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
            GestureDetector(
              onTap: () async {
                const String msg = "Please Help me ";
                final phoneNumber = Uri.parse('sms:+20${item.phone}?body=$msg');
                if (await canLaunchUrl(phoneNumber)) {
                  await launchUrl(phoneNumber);
                } else {
                  // ignore: use_build_context_synchronously
                  context.showSnack('Could not launch $phoneNumber',
                      isError: true);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.sms,
                  size: 20,
                  color: AppColors.error,
                ),
              ),
            ),
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
