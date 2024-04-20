import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

//? Handle Theme Mode
  List<String> theme = [];
  void selectTheme(String value, bool isDarkModeSystem) {
    emit(SettingsInitial());
    theme.clear();
    theme.add(value);
    value != 'SystemTheme'
        ? UserData.theme = value
        : UserData.theme = isDarkModeSystem ? 'Dark' : 'light';
    themeMode = UserData.theme == 'light' ? ThemeMode.light : ThemeMode.dark;
    emit(SettingSelectTheme());
  }

  ThemeMode? themeMode = UserData.theme != null
      ? UserData.theme == 'light'
          ? ThemeMode.light
          : ThemeMode.dark
      : null;

  void selectThemeDone() async {
    emit(SettingsInitial());
    await CacheHelper.saveData(key: 'theme', value: UserData.theme);
    emit(SettingSaveThemeTOCache());
  }

  //! Handle Theme Mode End
}
