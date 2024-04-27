import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/my_image.dart';
import 'package:diabetes/features/WorkOut/domain/entities/exercises_repo.dart';
import 'package:diabetes/features/WorkOut/presentation/pages/exercises_details.dart';
import 'package:flutter/material.dart';

class ExercisesItem extends StatelessWidget {
  const ExercisesItem({
    super.key,
    required this.item,
  });

  final ExercisesRepo item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExercisesDetails(
            repo: item,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          color: Theme.of(context).cardColor,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyNetworkImage(
                  image: item.gifUrl,
                  height: context.height * 0.1,
                  width: context.width * 0.2,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: context.width * 0.57),
                      child: Text(
                        item.name,
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.sports_bar, color: AppColors.grey),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          item.bodyPart,
                          style: TextStyle(color: AppColors.grey, fontSize: 16),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
