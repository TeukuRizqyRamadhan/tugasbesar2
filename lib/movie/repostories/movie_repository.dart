import 'package:dartz/dartz.dart';
import 'package:tugasbesar2/movie/models/movie_detail_model.dart';
import 'package:tugasbesar2/movie/models/movie_model.dart';
import 'package:tugasbesar2/movie/models/movie_video_model.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1});
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1});
  Future<Either<String, MovieResponseModel>> search({required String query});
  Future<Either<String, MovieDetailModel>> getDetail({required int id});
  Future<Either<String, MovieVideosModel>> getVideos({required int id});
  Future<Either<String, MovieResponseModel>> getTopIndo({int page = 1});
  Future<Either<String, MovieResponseModel>> getGenreCrime({int page = 1});
  Future<Either<String, MovieResponseModel>> getGenreHorror({int page = 1});
  Future<Either<String, MovieResponseModel>> getGenreComedy({int page = 1});
}
