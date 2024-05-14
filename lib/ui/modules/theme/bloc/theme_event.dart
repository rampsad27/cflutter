part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class ThemeChangeRequested extends ThemeEvent {
  final ThemeData themeData;

  ThemeChangeRequested({required this.themeData});
}
