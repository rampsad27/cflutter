import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_app/modules/auth/SignIn/bloc/login_bloc.dart';
import 'package:instagram_app/modules/auth/SignIn/repository/login_auth_repo.dart';
import 'package:instagram_app/modules/ui/likes/likesbloc/feed_bloc.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/bloc/details_bloc.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/repository/details_repository.dart';
import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/pickerbloc/picker_bloc.dart';
import 'package:instagram_app/modules/ui/screens/home_page.dart';
import 'package:instagram_app/modules/ui/screens/instagram_welcome_page.dart';
import 'package:instagram_app/modules/ui/screens/login_screen.dart';
import 'package:instagram_app/modules/ui/theme/bloc/theme_bloc.dart';
import 'package:instagram_app/modules/ui/theme/configs/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginAuthenticationRepository(),
        ),
        RepositoryProvider<DetailsAuthRepository>(
          create: (context) => DetailsAuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
                loginAuthenticationRepository:
                    context.read<LoginAuthenticationRepository>())
              ..add(LoginCheckRequested()),
          ),
          BlocProvider(
            create: (context) => PickerBloc(),
          ),
          BlocProvider(
            create: (context) => DetailsBloc(
              detailsAuthRepository: context.read<DetailsAuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FeedBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc()
              ..add(
                ThemeChangeRequested(themeData: AppTheme.darkTheme),
              ),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themestate) {
            return MaterialApp(
              theme: themestate is ThemeChanged
                  ? themestate.themeData
                  : AppTheme.darkTheme,
              home: BlocListener<LoginBloc, LoginState>(
                listenWhen: (previous, current) =>
                    current is LoginUnAuthenticated,
                listener: (context, state) {
                  if (state is LoginUnAuthenticated) {
                    // Navigator.pushAndRemoveUntil(context,
                    //     MaterialPageRoute(builder: (context) => const LoginPage(),));

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => true);
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      current is LoginAuthenticated ||
                      current is LoginUnAuthenticated ||
                      current is LoginInitial,
                  builder: (context, state) {
                    if (state is LoginAuthenticated) {
                      return const HomePage();
                    } else if (state is LoginUnAuthenticated) {
                      return const LoginPage();
                    } else {
                      return const InstagramWelcomePage();
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
