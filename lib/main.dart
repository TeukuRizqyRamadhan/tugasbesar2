import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar2/injector.dart';
import 'package:tugasbesar2/movie/pages/movie_page.dart';
import 'package:tugasbesar2/movie/providers/movie_get_discover_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_top_rated_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_top_indo_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_crime_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_horror_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_comedy_provider.dart';

import 'movie/providers/movie_serach_provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetDiscoverProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopRatedProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieSearchProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopIndoProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetGenreCrimeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetGenreHorrorProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetGenreComedyProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Film Database',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MoviePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
