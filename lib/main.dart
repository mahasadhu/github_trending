import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_trending/src/blocs/githubtrending/github_trending_bloc.dart';
import 'package:github_trending/src/di/di.dart' as app;
import 'package:github_trending/src/screens/home/home_screen.dart';

Future main() async {
  app.configureDependencies();
  await app.diInstance.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Trending',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: false,
      ),
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (context) => GithubTrendingBloc(app.diInstance<GithubTrendingRepository>()),
        child: const HomeScreen(),
      ),
    );
  }
}