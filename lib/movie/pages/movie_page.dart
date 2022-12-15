import 'package:flutter/material.dart';
import 'package:tugasbesar2/movie/components/movie_discover_component.dart';
import 'package:tugasbesar2/movie/components/movie_top_rated_component.dart';
import 'package:tugasbesar2/movie/components/movie_top_indo_component.dart';
import 'package:tugasbesar2/movie/components/movie_genre_crime_component.dart';
import 'package:tugasbesar2/movie/components/movie_genre_horror_component.dart';
import 'package:tugasbesar2/movie/components/movie_genre_comedy_component.dart';
import 'package:tugasbesar2/movie/pages/movie_search_page.dart';

import 'movie_pagination_page.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                const Text('Film Database'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => showSearch(
                  context: context,
                  delegate: MovieSearchPage(),
                ),
                icon: const Icon(Icons.search),
              ),
            ],
            floating: true,
            snap: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          _WidgetTitle(
            title: 'Film Rekomendasi',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.discover,
                  ),
                ),
              );
            },
          ),
          const MovieDiscoverComponent(),
          _WidgetTitle(
            title: 'Film Rating Teratas',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.topRated,
                  ),
                ),
              );
            },
          ),
          const MovieTopRatedComponent(),
          _WidgetTitle(
            title: 'Film Terbaik Indonesia',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.topIndo,
                  ),
                ),
              );
            },
          ),
          const MovieTopIndoComponent(),
          _WidgetTitle(
            title: 'Film Crime Indonesia',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.genreCrime,
                  ),
                ),
              );
            },
          ),
          const MovieGenreCrimeComponent(),
          _WidgetTitle(
            title: 'Film Horror Indonesia',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.genreHorror,
                  ),
                ),
              );
            },
          ),
          const MovieGenreHorrorComponent(),
          _WidgetTitle(
            title: 'Film Comedy Indonesia',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.genreComedy,
                  ),
                ),
              );
            },
          ),
          const MovieGenreComedyComponent(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onPressed;

  const _WidgetTitle({required this.title, required this.onPressed});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.black54,
                ),
              ),
              child: const Text('See All'),
            )
          ],
        ),
      );
}
