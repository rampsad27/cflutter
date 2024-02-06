import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/configs/app_theme.dart';
import 'package:ig/ui/common_blocs/bloc/theme_bloc.dart';
import 'package:ig/ui/modules/screen/feed.dart';
import 'package:ig/ui/modules/screen/login.dart';
// import 'package:ig/ui/modules/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()
        ..add(
          ThemeChangeRequested(themeData: AppTheme.lightTheme),
        ),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme:
                state is ThemeChanged ? state.themeData : AppTheme.lightTheme,
            home:
                // const FeedScreen(),
                const LoginPage(),
          );
        },
      ),
    );
  }
}
