import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/search/models/search_result/result.dart';
import 'package:netflix_clone/domain/search/models/search_result/search_result.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

@LazySingleton(as: SearchSearvice)
class SearchImpl implements SearchSearvice {
  @override
  Future<Either<MainFailure, SearchResult>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.Search,
        queryParameters: {'query': movieQuery},
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResult.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
