import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/loginauth/bloc/login_bloc.dart';
import 'package:ig/ui/modules/loginauth/repository/authentication_repository.dart';
import 'package:ig/ui/modules/theme/bloc/theme_bloc.dart';
import 'package:ig/ui/modules/theme/configs/app_theme.dart';

import 'package:ig/ui/modules/screen/login.dart';
// import 'package:ig/ui/modules/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc()
              ..add(
                ThemeChangeRequested(themeData: AppTheme.lightTheme),
              ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
                authenticationRepository:
                    context.read<AuthenticationRepository>()),
          ),
        ],
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
      ),
    );
  }
}
