import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';

import 'package:ig/ui/modules/loginauth/bloc/login_bloc.dart';
import 'package:ig/ui/modules/loginauth/repository/authentication_repository.dart';
import 'package:ig/ui/modules/screen/edit_profile.dart';
import 'package:ig/ui/modules/screen/feed.dart';
import 'package:ig/ui/modules/screen/myprofile.dart';

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
                    context.read<AuthenticationRepository>())
              ..add(CheckLoggedInUser()),
          ),
          BlocProvider(create: (context) => ImageAndFilePickerBloc())
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              theme: themeState is ThemeChanged
                  ? themeState.themeData
                  : AppTheme.lightTheme,
              home: BlocListener<LoginBloc, LoginState>(
                listenWhen: (previous, current) => current is UnAuthenticated,
                listener: (context, state) {
                  if (state is UnAuthenticated) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      current is Authenticated ||
                      current is UnAuthenticated ||
                      current is LoginInitial,
                  builder: (context, loginState) {
                    if (loginState is Authenticated) {
                      return const FeedScreen();
                    } else {
                      return const LoginPage();
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
