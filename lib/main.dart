import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ig/ui/modules/loginauth/bloc/login_bloc.dart';
import 'package:ig/ui/modules/loginauth/repository/authentication_repository.dart';
import 'package:ig/ui/modules/screen/edit_profile.dart';
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
        ],
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => current is UnAuthenticated,
          listener: (context, state) {
            if (state is UnAuthenticated) {
              // Navigator.pushAndRemoveUntil(context,
              //     MaterialPageRoute(builder: (context) => const LoginPage()))
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
                current is Authenticated ||
                current is UnAuthenticated ||
                current is LoginInitial,
            builder: (context, state) {
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: state is ThemeChanged
                        ? state.themeData
                        : AppTheme.lightTheme,
                    home:
                        // const MyProfile(),
                        // const FeedScreen(),
                        // const EditProfile(),
                        const LoginPage(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
