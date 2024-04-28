import 'package:cached_network_image/cached_network_image.dart';
import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatePage extends StatelessWidget {
  final NutationsRepo repo;

  const RatePage({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rate meal',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<NutritionCubit, NutritionState>(
        builder: (context, state) {
          final cubit = NutritionCubit.get(context);
          return Loading(
            loading: state is NutritionRateRecipeLoading,
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CircleAvatar(
                        radius: context.width * 0.2,
                        backgroundImage: CachedNetworkImageProvider(
                          repo.image,
                        ),
                      ),
                    ),
                    const Center(
                        child: Text(
                      'how did you enjoy your meal ?',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                          child: Text(
                        'your feedback help us to improve our recipes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RateStarsList(cubit: cubit),
                    if (cubit.rate != 0)
                      Center(
                          child: AnimatedContainer(
                        duration: const Duration(milliseconds: 550),
                        child: Text(
                          cubit.rateName,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ))
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: context.width,
                  child: Card(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: MyButton(
                        text: 'Continue',
                        onTap: () {
                          if (cubit.rate != 0) {
                            cubit.rateRecipe(repo.id);
                          }
                        },
                        buttonColor:
                            cubit.rate > 0 ? AppColors.primary : AppColors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        listener: (BuildContext context, NutritionState state) {
          if (state is NutritionRateRecipeSuccessfully) {
            context.pop;
            context.showSnack('Successfully Rating this Recipe');
          }
        },
      ),
    );
  }
}

class RateStarsList extends StatelessWidget {
  const RateStarsList({
    super.key,
    required this.cubit,
  });

  final NutritionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.height * 0.07,
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onDoubleTap: () {
                if (index == 0) {
                  cubit.selectStar(0);
                }
              },
              onTap: () {
                cubit.selectStar(index + 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 550),
                    crossFadeState: cubit.rate > index
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Icon(
                      Icons.star_outline_sharp,
                      size: 40,
                      color: AppColors.grey,
                    ),
                    secondChild: const Icon(
                      Icons.star,
                      size: 40,
                      color: Colors.orange,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
