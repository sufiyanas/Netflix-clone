import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.dowloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
