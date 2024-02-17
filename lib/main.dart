import 'package:extraaa/ui/modules/bloc/book_bloc.dart';
import 'package:extraaa/ui/modules/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
