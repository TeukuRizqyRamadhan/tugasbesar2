import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tugasbesar2/movie/models/movie_model.dart';
import 'package:tugasbesar2/movie/providers/movie_get_discover_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_now_playing_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_top_rated_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_top_indo_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_crime_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_horror_provider.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_comedy_provider.dart';
import 'package:tugasbesar2/widget/item_movie_widget.dart';

import 'movie_detail_page.dart';

enum TypeMovie { discover, nowPlaying, topRated, topIndo, genreCrime, genreHorror, genreComedy}

class MoviePaginationPage extends StatefulWidget {
  const MoviePaginationPage({super.key, required this.type});

  final TypeMovie type;

  @override
  State<MoviePaginationPage> createState() => _MoviePaginationPageState();
}

class _MoviePaginationPageState extends State<MoviePaginationPage> {
  final PagingController<int, MovieModel> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      switch (widget.type) {
        case TypeMovie.discover:
          context.read<MovieGetDiscoverProvider>().getDiscoverWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TypeMovie.topRated:
          context.read<MovieGetTopRatedProvider>().getTopRatedWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TypeMovie.nowPlaying:
          context.read<MovieGetNowPlayingProvider>().getNowPlayingWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TypeMovie.topIndo:
          context.read<MovieGetTopIndoProvider>().getTopIndoWithPagination(
            context,
            pagingController: _pagingController,
            page: pageKey,
          );
          break;
        case TypeMovie.genreCrime:
          context.read<MovieGetGenreCrimeProvider>().getGenreCrimeWithPagination(
            context,
            pagingController: _pagingController,
            page: pageKey,
          );
          break;
        case TypeMovie.genreHorror:
          context.read<MovieGetGenreHorrorProvider>().getGenreHorrorWithPagination(
            context,
            pagingController: _pagingController,
            page: pageKey,
          );
          break;
        case TypeMovie.genreComedy:
          context.read<MovieGetGenreComedyProvider>().getGenreComedyWithPagination(
            context,
            pagingController: _pagingController,
            page: pageKey,
          );
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (_) {
          switch (widget.type) {
            case TypeMovie.discover:
              return const Text('Discover Movies');
            case TypeMovie.topRated:
              return const Text('Top Rated Movies');
            case TypeMovie.topIndo:
              return const Text('Film Terbaik Indonesia');
            case TypeMovie.genreCrime:
              return const Text('Film Crime Indonesia');
            case TypeMovie.genreHorror:
              return const Text('Film Horror Indonesia');
            case TypeMovie.genreComedy:
              return const Text('Film Comedy Indonesia');
            case TypeMovie.nowPlaying:
              return const Text('Now Playing Movies');
          }
        }),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: PagedListView.separated(
        padding: const EdgeInsets.all(16.0),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<MovieModel>(
          itemBuilder: (context, item, index) => ItemMovieWidget(
            movie: item,
            heightBackdrop: 260,
            widthBackdrop: double.infinity,
            heightPoster: 140,
            widthPoster: 80,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return MovieDetailPage(id: item.id);
                },
              ));
            },
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
