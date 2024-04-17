import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/presentation/view/index.dart';
import 'package:pera_soft1/product/base/model/base_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends BaseBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          themeData: ThemeData.light(),
        )) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.isLightTheme) {
        safeEmit(state.copyWith(
          themeData: ThemeData.light(),
        ));
      } else {
        safeEmit(state.copyWith(
          themeData: ThemeData.dark(),
        ));
      }
    });
  }
}
