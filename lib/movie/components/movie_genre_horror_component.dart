import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar2/movie/pages/movie_detail_page.dart';
import 'package:tugasbesar2/movie/providers/movie_get_genre_horror_provider.dart';
import 'package:tugasbesar2/widget/image_widget.dart';

class MovieGenreHorrorComponent extends StatefulWidget {
  const MovieGenreHorrorComponent({super.key});

  @override
  State<MovieGenreHorrorComponent> createState() => _MovieGenreHorrorComponentState();
}

class _MovieGenreHorrorComponentState extends State<MovieGenreHorrorComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetGenreHorrorProvider>().getGenreHorror(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Consumer<MovieGetGenreHorrorProvider>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12.0)),
              );
            }

            if (provider.movies.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ImageNetworkWidget(
                    imageSrc: provider.movies[index].posterPath,
                    height: 200,
                    width: 120,
                    radius: 12.0,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          return MovieDetailPage(id: provider.movies[index].id);
                        },
                      ));
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8.0,
                ),
                itemCount: provider.movies.length,
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Text('Not found genre horror movies'),
              ),
            );
          },
        ),
      ),
    );
  }
}
