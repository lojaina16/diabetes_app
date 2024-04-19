import 'package:diabetes/features/Auth/pages/login.dart';
import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/cubit/home_cubit_state.dart';
import 'package:diabetes/features/home/model/home_category.dart';
import 'package:diabetes/features/home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../image_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        final user = cubit.userModel;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Diabetes App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          drawer: HomeDrawer(
            user: user,
            cubit: cubit,
          ),
          body: Loading(
            loading:
                state is HomeGetUserDataLoading || state is HomeSingOutLoading,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: HomeCategory.category.length,
              padding: EdgeInsets.only(top: context.height * 0.05, right: 16),
              itemBuilder: (context, index) {
                final category = HomeCategory.category[index];
                return ImageWidget(
                  category: category,
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8, crossAxisCount: 2),
            ),
          ),
        );
      },
      listener: (BuildContext context, HomeState state) {
        if (state is HomeSingOutSuccessfully) {
          context.nextPageWitheRemove(LoginScreen.routeName);
        }
      },
    );
  }
}
