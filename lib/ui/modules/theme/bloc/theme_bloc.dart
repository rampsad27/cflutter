import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/theme/bloc/theme_state.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeChangeRequested>((event, emit) {
      emit(ThemeChanged(
        themeData: event.themeData,
        themeMode: event.themeData.brightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
      ));
    });
  }
}
