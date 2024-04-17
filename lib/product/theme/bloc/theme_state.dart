part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState({
    this.themeData,
  });

  final ThemeData? themeData;
  @override
  List<Object?> get props => [themeData];

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}

final class ThemeInitial extends ThemeState {}
