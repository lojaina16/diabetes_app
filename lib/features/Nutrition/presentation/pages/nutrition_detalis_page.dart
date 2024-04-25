import 'package:diabetes/core/utils/my_image.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/food_details_row_head.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/ingredient_list.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/instruction_list.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/nutration_list.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/rate_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NutritionDetails extends StatelessWidget {
  final NutationsRepo repo;
  const NutritionDetails({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<NutritionCubit, NutritionState>(
        builder: (context, state) {
          final cubit = NutritionCubit.get(context);
          return ListView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            padding: const EdgeInsets.all(0),
            addRepaintBoundaries: false,
            children: [
              MyNetworkImage(image: repo.image),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repo.name,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    FoodDetailsHeadRow(cubit: cubit, repo: repo),
                    NutritionList(cubit: cubit, repo: repo),
                    const SizedBox(
                      height: 16,
                    ),
                    IngredientList(cubit: cubit, repo: repo),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Instruction',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InstructionList(repo: repo),
                    const RateCard()
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
