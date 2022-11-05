import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:netflix_clone/domain/search/models/search_result/search_result.dart';

abstract class SearchSearvice {
  Future<Either<MainFailure, SearchResult>> searchMovies(
      {required String movieQuery});
}
