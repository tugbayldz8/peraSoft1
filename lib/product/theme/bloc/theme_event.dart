part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ChangeThemeEvent extends ThemeEvent {
  final bool isLightTheme;

  const ChangeThemeEvent(this.isLightTheme);
}
