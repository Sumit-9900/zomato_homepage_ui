import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_ui/core/theme/app_theme.dart';
import 'package:zomato_ui/features/home/repository/home_local_repository.dart';
import 'package:zomato_ui/features/home/view/pages/home_page.dart';
import 'package:zomato_ui/features/home/viewmodel/bloc/biryani_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    BlocProvider(
      create: (context) =>
          BiryaniBloc(HomeLocalRepositoryImpl())..add(BiryaniLoaded()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zomato UI',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
