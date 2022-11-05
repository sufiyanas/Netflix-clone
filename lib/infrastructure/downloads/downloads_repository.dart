import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.dowloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        print(downloadsList);

        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
